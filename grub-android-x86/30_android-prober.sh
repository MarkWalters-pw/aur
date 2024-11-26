#! /bin/sh
set -e

# grub-mkconfig helper script.
# Copyright (C) 2006,2007,2008,2009  Free Software Foundation, Inc.
#
# GRUB is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# GRUB is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with GRUB.  If not, see <http://www.gnu.org/licenses/>.

. "$pkgdatadir/grub-mkconfig_lib"

export TEXTDOMAIN=grub
export TEXTDOMAINDIR="${datarootdir}/locale"

CLASS="--class android --class os"
OS="Android"

# Default to disabling partition uuid support to maintian compatibility with
# older kernels.
: "${GRUB_DISABLE_LINUX_PARTUUID:=true}"

# Android x68 supported file systems
# Note that by default, Android initrds don't support btrfs and some other
# filesystems
: "${ANDROID_SUPPORTED_FS:="ext2 ext3 ext4 vfat exfat ntfs"}"

# Default parameters
# GRUB_CMDLINE_ANDROID=${GRUB_CMDLINE_ANDROID-"androidboot.hardware=android_x86_64 androidboot.selinux=permissive acpi_sleep=s3_bios,s3_mode"}
. /etc/default/grub

sub_indent() { echo -e "$submenu_indentation$*"; }
gfind() { grep "$2" <<<"${1}"; }

android_entry() {
	title="$1"
	src="$2"
	kernel="$3"
	initrd="$4"
	disk="$5"
	device_id="$6"
	type="$7"

	[ "$type" != "default" ] &&
		title="$title, with kernel ${kernel##*/}, and initrd ${initrd##*/}"

	sub_indent "menuentry '$(echo "$title" | grub_quote)' ${CLASS} \$menuentry_id_option '$OS-${src##*/}-${kernel##*/}-${initrd##*/}-$type-$device_id' {"

	save_default_entry | grub_add_tab

	# Use ELILO's generic "efifb" when it's known to be available.
	# FIXME: We need an interface to select vesafb in case efifb can't be used.
	if [ ! "$GRUB_GFXPAYLOAD_LINUX" ]; then
		sub_indent "	load_video"
		grep -qx "CONFIG_FB_EFI=y" "${config}" 2>/dev/null &&
			grep -qx "CONFIG_VT_HW_CONSOLE_BINDING=y" "${config}" 2>/dev/null &&
			sub_indent "	set gfxpayload=keep"

	else
		[ "$GRUB_GFXPAYLOAD_LINUX" = text ] ||
			sub_indent "	load_video"
		sub_indent "	set gfxpayload=$GRUB_GFXPAYLOAD_LINUX"
	fi

	sub_indent "	insmod gzio"
	echo "$disk" | sed "s/^/$submenu_indentation	/gm"
	sub_indent "	linux $kernel $GRUB_CMDLINE_ANDROID root=/dev/ram0 SRC=$src"
	sub_indent "	initrd $initrd"

	sub_indent "}\n"
}

_mount_fs() {
	disktmp="$(mktemp)"
	rm -f "$disktmp"
	mkdir -p "$disktmp" || true
	mount -o ro${2:+,$2} -t "${3:-auto}" "$1" "$disktmp"
	echo "$disktmp"
}

_find_buildprop() {
	if [ -d "$1" ]; then
		buildprop_file=$1/system/build.prop
		[ -f "$1/system/build.prop" ] || buildprop_file=$1/build.prop
		cat "$buildprop_file"
	elif [ -f "$1" ]; then
		case "$1" in
		*system.img)
			imgdir="$(_mount_fs "$1" loop)"
			_find_buildprop "$imgdir"
			umount -lf "$imgdir"
			rm -rf "$imgdir"
			;;
		*system.?fs)
			sfsdir="$(_mount_fs "$1" loop)"
			_find_buildprop "$sfsdir/system.img"
			umount -lf "$sfsdir"
			rm -rf "$sfsdir"
			;;
		esac
	fi
}

find_os() {
	pre_mounted="$(lsblk -pndo mountpoints "$1" | tail -1)"
	if [ "$pre_mounted" ]; then
		mountpoint="$pre_mounted"
	else
		fs=$2
		if [ "$2" = "ntfs" ]; then
			modinfo ntfs3 >/dev/null && fs=ntfs3 || fs=ntfs-3g
		fi
		mountpoint="$(_mount_fs "$1" "" "$fs")"
	fi

	# The damn `find` command
	foundpaths="$(find "$mountpoint" \( \
		-name 'system' -o \
		-name 'system.img' -o \
		-name 'system.sfs' -o \
		-name 'system.efs' \) \
		-not \( -path "$mountpoint/bin/*" -prune \) \
		-not \( -path "$mountpoint/boot/efi/*" -prune \) \
		-not \( -path "$mountpoint/dev/*" -prune \) \
		-not \( -path "$mountpoint/etc/*" -prune \) \
		-not \( -path "$mountpoint/lib/*" -prune \) \
		-not \( -path "$mountpoint/lib64/*" -prune \) \
		-not \( -path "$mountpoint/lib32/*" -prune \) \
		-not \( -path "$mountpoint/proc/*" -prune \) \
		-not \( -path "$mountpoint/run/*" -prune \) \
		-not \( -path "$mountpoint/sbin/*" -prune \) \
		-not \( -path "$mountpoint/sys/*" -prune \) \
		-not \( -path "$mountpoint/usr/*" -prune \) \
		-not \( -path "$mountpoint/var/*" -prune \) \
		-not \( -path "$mountpoint/tmp/*" -prune \) \
		-not \( -path "$mountpoint/Program\ Files/*" -prune \) \
		-not \( -path "$mountpoint/Program\ Files\ (x86)/*" -prune \) \
		-not \( -path "$mountpoint/ProgramData/*" -prune \) \
		-not \( -path "$mountpoint/Windows/*" -prune \) \
		-not \( -path "$mountpoint/EFI/*" -prune \) \
		2>/dev/null)"

	if [ ! "$foundpaths" ]; then
		if [ ! "$pre_mounted" ]; then
			umount -lf "$mountpoint"
			rm -rf "$mountpoint"
		fi
		return
	fi

	# get device info (in grub)
	disk="$(prepare_grub_to_access_device "$1")"
	boot_device_id="$(grub_get_device_id "$1")"

	while read -r path; do
		[ "${path}" ] || continue
		systempath="$path"

		path=${path%/*}

		# Getting build.prop contents
		buildprop="$(_find_buildprop "$systempath")" || continue

		# Parse version
		buildver="$(grep -E "ro.([a-z]*).version" <<<"$(grep -v build <<<"${buildprop}")")"
		for version in $buildver; do
			case $version in
			ro.bliss.version*)
				os="Bliss OS"
				ver="$(gfind "$buildprop" "ro.bliss.version=")"
				break
				;;
			ro.lineage.version*)
				os="Lineage OS"
				ver="$(gfind "$buildprop" "ro.lineage.version=")"
				;;
			ro.phoenix.version*)
				os="Phoenix OS"
				ver="$(gfind "$buildprop" "ro.phoenix.version.code=")"
				break
				;;
			ro.primeos.version*)
				os="Prime OS"
				ver="$(gfind "$buildprop" "ro.primeos.version.name=")"
				break
				;;
			*)
				os="AOSP"
				ver="$(gfind "$buildprop" "ro.build.version.release=") $(gfind "$buildprop" "ro.build.flavor=")"
				;;
			esac
		done
		ver=${ver##*=}

		src=$(echo "${path#"$mountpoint"}" | sed 's/ /\\ /g')
		type=default

		echo "Found $os version $ver on $1" >&2

		MAIN_ENTRY=""
		EXTENDED_ENTRIES=""

		# Extra indentation to add to menu entries in a submenu. We're not in a submenu
		# yet, so it's empty. In a submenu it will be equal to '\t' (one tab).
		submenu_indentation=""

		# Checking for cpu id/manufacturer and microcode file
		vendor=$(grep vendor_id /proc/cpuinfo | head -1 | awk '{print $3}')
		case "$vendor" in
		"GenuineIntel") : "intel" ;;
		"AuthenticAMD") : "amd" ;;
		esac
		vendor=$_
		microcode=$(find "$path" -maxdepth 1 -type f \( -iname "$vendor-ucode.img" -o -iname "$vendor-microcode.img" \) -print -quit 2>/dev/null)

		for kernel in "$path"/vmlinu[xz]* "$path"/kernel*; do
			[ -f "$kernel" ] || continue
			for initrd in "$path"/initrd*.img "$path"/initramfs*.img; do
				[ -f "$initrd" ] || continue

				entry() {
					android_entry \
						"$os $ver" \
						"$src" \
						"${src}${kernel#"$path"}" \
						"${microcode:+"${src}${microcode#"$path"} "}${src}${initrd#"$path"}" \
						"$disk" \
						"$boot_device_id" \
						"$1"
				}

				if [ "$type" = "default" ]; then
					MAIN_ENTRY="$(entry default)"
					type=extended
					submenu_indentation=$grub_tab
				fi
				EXTENDED_ENTRIES="$EXTENDED_ENTRIES\n$(entry extended)"
			done
		done

		echo -e "

$MAIN_ENTRY

submenu '$(echo "Advanced options for $os $ver" | grub_quote)' \$menuentry_id_option '$OS-${src##*/}-$type-$boot_device_id' { 
$EXTENDED_ENTRIES
}

"
	done <<<"$foundpaths"

	if [ ! "$pre_mounted" ]; then
		umount -lf "$mountpoint"
		rm -rf "$mountpoint"
	fi
}

echo "Detecting android..." >&2

# Scan for Android partitions that contain both system(folder, .img, .sfs)
# and data(folder, .img, .sfs)

while read -r blk; do
	blk_fs=$(lsblk -prndo fstype "$blk")
	[ "$blk_fs" ] &&
		gfind "$ANDROID_SUPPORTED_FS" "$blk_fs" >/dev/null ||
		continue
	find_os "$blk" "$blk_fs"
done <<<"$(
	ls /sys/class/block/ |
		grep ".*[0-9]$" |
		grep -Ev "loop|ram|nbd|fd" |
		sed "s|^|/dev/|g"
)"

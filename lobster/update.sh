#!/bin/bash
# Licensed under the MIT License <http://opensource.org/licenses/MIT>.
# SPDX-License-Identifier: MIT
# Author: Suren <dev at behnamlal dot xyz>
#
# This script updates the PKGBUILD file to the latest version of lobster
# and commits the changes to the repository.
#
# dependencies: curl, pacman-contrib, git, makepkg,

url=$( grep -oP '(?<=url = ).+' .SRCINFO | tr -d "'" )
repo_name=$( echo "$url" | sed -e 's~^https://github.com/~~' -e 's~\.git$~~' )

latest_version=$(curl -s "https://api.github.com/repos/${repo_name}/releases/latest" | grep -oP '(?<="tag_name": ")[^"]+')
old_version=$( grep -oP '(?<=pkgver = ).+' .SRCINFO | tr -d "'" )

echo "last Lobster version: $latest_version"


if [[ $old_version != $latest_version ]]; then
	sed -i "s/pkgver=.*/pkgver=$latest_version/" PKGBUILD
	if command -v updpkgsums &> /dev/null; then
		updpkgsums
	else
		echo "enter new md5sums: "
		read -r md5sums
		sed -i "s/md5sums=.*/md5sums=('$md5sums')/" PKGBUILD
	fi
	makepkg --printsrcinfo > .SRCINFO

	echo "update $old_version -> $latest_version"

	git add PKGBUILD .SRCINFO

	# Read the PKGBUILD file and extract the maintainer's name and contact information
	maintainer_line=$(grep -m1 '^# Maintainer:' PKGBUILD)
	maintainer=${maintainer_line##*Maintainer:}
	# Trim leading and trailing whitespace from the maintainer's name
	maintainer=$(echo "$maintainer" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')

	git commit -m "$old_version -> $latest_version : Upgrade package

	This commit upgrades the package from version $old_version to $latest_version. This upgrade ensures that users have access to the latest version with the most up-to-date functionality.

	Signed-off-by: $maintainer"

	git --no-pager diff origin/master..HEAD
	echo "Do you want to push this commit to the remote repository? (y/n)"
	read -r answer
	if [[ $answer == "y" ]]; then
		git push origin master
		echo "pushed"
	else
		echo "not pushed"
	fi

else
	echo "no updates found"
fi

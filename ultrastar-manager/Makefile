# This will update the checksums and build the package
all: updateinfo
	makepkg -sr

# This will do the same as all, but will install it to the local system as well
install: updateinfo
	makepkg -sri

# This will update the checksums and .SRCINFO
updateinfo:
	updpkgsums
	makepkg --printsrcinfo > .SRCINFO

# This will remove the files downloaded and created in the build process
clean:
	rm -rf pkg src UltraStar-Manager ultrastar-manager-*.pkg.*

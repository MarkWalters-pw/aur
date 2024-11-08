BINARY := skaffold
VERSION_FILE := VERSION
VERSION := $(shell cat $(VERSION_FILE))

.PHONY: all
all: update_pkgbuild test_makepkg update_srcinfo clean

.PHONY: update_pkgbuild
update_pkgbuild:
	@echo "Updating PKGBUILD with version $(VERSION)..."
	@sed -i "s/^pkgver=.*/pkgver=$(VERSION)/" PKGBUILD
	@echo "Fetching checksum for x86_64..."
	@curl -sSL https://github.com/GoogleContainerTools/$(BINARY)/releases/download/v$(VERSION)/$(BINARY)-linux-amd64.sha256 -o x86_64.sha256
	@echo "Fetching checksum for aarch64..."
	@curl -sSL https://github.com/GoogleContainerTools/$(BINARY)/releases/download/v$(VERSION)/$(BINARY)-linux-arm64.sha256 -o aarch64.sha256
	@echo "Updating sha256sums in PKGBUILD..."
	@x86_64_sum=$$(cut -d' ' -f1 x86_64.sha256); \
	aarch64_sum=$$(cut -d' ' -f1 aarch64.sha256); \
	sed -i "/^  x86_64)/ s|sha256sums=('[^']*')|sha256sums=('$$x86_64_sum')|" PKGBUILD; \
	sed -i "/^  aarch64)/ s|sha256sums=('[^']*')|sha256sums=('$$aarch64_sum')|" PKGBUILD
	@echo "PKGBUILD updated."

.PHONY: test_makepkg
test_makepkg:
	@echo "Testing PKGBUILD..."
	@makepkg --syncdeps --cleanbuild
	@echo "PKGBUILD test completed successfully."

.PHONY: update_srcinfo
update_srcinfo:
	@makepkg --printsrcinfo > .SRCINFO
	@echo "Updated .SRCINFO file."

.PHONY: clean
clean:
	@git clean -fdx
	@echo "Cleanup complete."

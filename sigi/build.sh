#!/bin/sh

set -euo pipefail

clean() {
    rm -f ./sigi-*.tar.gz ./sigi-*.tar.zst
    rm -rf ./pkg ./src
}

install() {
    # Assumes you are on Arch, btw.
    if ! makepkg
    then
        sha256sum ./sigi-*.tar.gz
        exit 1
    fi
    makepkg --printsrcinfo > .SRCINFO
}

check() {
    pkgdir="./pkg/sigi"
    if [ ! -x "$pkgdir/usr/bin/sigi" ]
    then
        >&2 echo "Sigi binary was not installed and executable"
        exit 1
    elif [ ! -f "$pkgdir/usr/share/man/man1/sigi.1.gz" ]
    then
        >&2 echo "Sigi man page was not installed"
        exit 1
    fi

    "$pkgdir"/usr/bin/sigi --version
}

push() {
    git push

    local branch="packaging/arch-aur"
    git branch -d $branch || true
    git checkout -b $branch
    git push mirror $branch
    git checkout master
    git branch -d $branch
}

bootstrap() {
    pacman -S git base-devel cargo
}

help() {
    echo "Usage: $0 [bootstrap|clean|install|check]..."
}

run() {
    case "$1" in
        bootstrap) bootstrap ;;
        clean)     clean     ;;
        install)   install   ;;
        check)     check     ;;
        push)      push      ;;
        *)         >&2 help
                   >&2 echo "Unknown target: $1"
                   exit 1 ;;
    esac
}

# Exit with help message if no input.
if [ "$*unset" = unset ]
then
    help && exit
fi

set -x

# Handle all args as run commands.
for cmd in "$@"
do
    run "$cmd"
done

# vim: set expandtab ts=4 sw=4

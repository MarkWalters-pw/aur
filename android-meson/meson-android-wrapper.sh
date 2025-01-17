#!/bin/sh

source android-env @TRIPLE@

if [ -z ${CROSS_FILE} ]; then
    CROSS_FILE=/usr/share/android/toolchain-android-@TRIPLE@.meson
fi

exec meson setup \
    --prefix          ${ANDROID_PREFIX} \
    --libdir          ${ANDROID_PREFIX_LIB} \
    --libexecdir      ${ANDROID_PREFIX_LIB} \
    --bindir          ${ANDROID_PREFIX_BIN} \
    --sbindir         ${ANDROID_PREFIX_BIN} \
    --includedir      ${ANDROID_PREFIX_INCLUDE} \
    --datadir         ${ANDROID_PREFIX_SHARE} \
    --mandir          ${ANDROID_PREFIX_SHARE}/man \
    --infodir         ${ANDROID_PREFIX_SHARE}/info \
    --localedir       ${ANDROID_PREFIX_SHARE}/locale \
    --sysconfdir      ${ANDROID_PREFIX_ETC} \
    --localstatedir   ${ANDROID_PREFIX}/var \
    --sharedstatedir  ${ANDROID_PREFIX}/var/lib \
    --buildtype       release \
    --wrap-mode       nofallback \
    -D                b_lto=true \
    -D                strip=true \
    --cross-file      ${CROSS_FILE} \
    --default-library both \
    "$@"

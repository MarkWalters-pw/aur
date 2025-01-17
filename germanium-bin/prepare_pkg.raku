#!/usr/bin/env raku

unit sub MAIN ($pkgver);

put 'Downloading checksums file.';

my $p := run «wget -q -O -
         "https://github.com/matsuyoshi30/germanium/releases/download/v$pkgver/germanium_{$pkgver}_checksums.txt"»,
         :out;

my %checksums = $p.out.lines.grep(/linux/).split(/\s+/).hash.antipairs;

my $PKGBUILD_file := 'PKGBUILD'.IO;

my $PKGBUILD = $PKGBUILD_file.slurp;

# Set package version
$PKGBUILD ~~ s/<?after ^^ 'pkgver='>\N+/$pkgver/;

# Set package checksums
for %checksums.kv -> $linux, $checksum {
    $PKGBUILD ~~ s/<?after ^^ 'sha256sums_x86_64='> \N+/('$checksum')/ if $linux ~~ /'x86_64'/;
    $PKGBUILD ~~ s/<?after ^^ 'sha256sums_i686='> \N+/('$checksum')/ if $linux ~~ /'386'/;
    $PKGBUILD ~~ s/<?after ^^ 'sha256sums_aarch64='> \N+/('$checksum')/ if $linux ~~ /'arm64'/;
}

put 'Writing to PKGBUILD.';
$PKGBUILD_file.spurt: $PKGBUILD;

put 'Writing to .SRCINFO';
run <makepkg --printsrcinfo>, :out('.SRCINFO'.IO.open: :w);

put 'Running makepkg --install';
run <makepkg --install>;

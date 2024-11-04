git clone --depth 1 . deb/deshader
if [ -z "$releases" ]; then
    releases="debian-bullseye"
fi
for release in $releases; do
    mkdir deb/$release
    docker run -v "$PWD/deb/deshader:/home/makedeb" ghcr.io/makedeb/makedeb:$release bash makedeb.bash > >(tee -a deb/$release/stdout.log) 2> >(tee -a deb/$release/stderr.log >&2)
    mv deb/deshader/*.deb deb/$release
done
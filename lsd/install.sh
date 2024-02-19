#/bin/bash

set -eou pipefail

echo "Installing lsd"

# use github api to get latest version
url=$(curl -s "https://api.github.com/repos/lsd-rs/lsd/releases/latest" \
        | grep "https://.*$(uname -m).*$(uname | tr '[:upper:]' '[:lower:]')-gnu.tar.gz" \
        | cut -d '"' -f 4)

tarball=$(basename ${url})
lsd=$(echo ${tarball} | sed 's/\.tar\.gz//g')

curl -L -O ${url} &&
tar -xzvf ${tarball} &&
mv ${lsd}/lsd ${XDG_LOCAL_HOME}/bin/ &&
rm -rf ${tarball} ${lsd}

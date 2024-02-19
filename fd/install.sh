#/bin/bash

set -eou pipefail

echo "Installing fd"

# use github api to get latest version
url=$(curl -s "https://api.github.com/repos/sharkdp/fd/releases/latest" \
        | grep "https://.*$(uname -m).*$(uname | tr '[:upper:]' '[:lower:]')-gnu.tar.gz" \
        | cut -d '"' -f 4)

tarball=$(basename ${url})
fd=$(echo ${tarball} | sed 's/\.tar\.gz//g')

curl -L -O ${url} &&
tar -xzvf ${tarball} &&
mv ${fd}/fd ${XDG_LOCAL_HOME}/bin/ &&
rm -rf ${tarball} ${fd}

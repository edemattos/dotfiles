#/bin/bash

set -eou pipefail

echo "Installing vivid"

# use github api to get latest version
url=$(curl -s "https://api.github.com/repos/sharkdp/vivid/releases/latest" \
        | grep "https://.*$(uname -m).*$(uname | tr '[:upper:]' '[:lower:]')-gnu.tar.gz" \
        | cut -d '"' -f 4)
if [[ -z ${url} ]]; then
    echo "Not found: vivid"
    exit 0
fi

tarball=$(basename ${url})
vivid=$(echo ${tarball} | sed 's/\.tar\.gz//g')

curl -L -O ${url} &&
tar -xzvf ${tarball} &&
mv ${vivid}/vivid ${XDG_LOCAL_HOME}/bin/ &&
rm -rf ${tarball} ${vivid}

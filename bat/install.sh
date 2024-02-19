#/bin/bash

set -eou pipefail

if [[ ! -z $(which bat) ]]; then
    echo "Already exists: bat"
    exit 0
fi

echo "Installing bat"

# use github api to get latest version
url=$(curl -s "https://api.github.com/repos/sharkdp/bat/releases/latest" \
        | grep "https://.*$(uname -m).*$(uname | tr '[:upper:]' '[:lower:]')-gnu.tar.gz" \
        | cut -d '"' -f 4)

tarball=$(basename ${url})
bat=$(echo ${tarball} | sed 's/\.tar\.gz//g')

curl -L -O ${url} &&
tar -xzvf ${tarball} &&
mv ${bat}/bat ${XDG_LOCAL_HOME}/bin/ &&
rm -rf ${tarball} ${bat}

#/bin/bash

set -eou pipefail

echo "Installing fzf"

# use github api to get latest version
url=$(curl -s "https://api.github.com/repos/junegunn/fzf/releases/latest" \
        | grep "https://.*$(uname | tr '[:upper:]' '[:lower:]')_$(uname -m).tar.gz" \
        | cut -d '"' -f 4)
if [[ -z ${url} ]]; then
    echo "Not found: fzf"
    exit 0
fi

tarball=$(basename ${url})
fzf=$(echo ${tarball} | sed 's/\.tar\.gz//g')

curl -L -O ${url} &&
tar -xzvf ${tarball} &&
mv ${fzf}/fzf ${fzf}/fzf-tmux ${XDG_LOCAL_HOME}/bin/ &&
rm -rf ${tarball} ${fzf}

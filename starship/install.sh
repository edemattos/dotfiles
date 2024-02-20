#/bin/bash

set -eou pipefail

if [[ ! -z $(which starship) ]]; then
    echo "Already exists: starship"
    exit 0
fi

echo "Installing starship"
curl -sS https://starship.rs/install.sh | sh -s -- -y -b ${XDG_LOCAL_HOME}/bin

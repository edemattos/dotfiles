#/bin/bash

set -eou pipefail

if [[ -d ${XDG_LOCAL_HOME}/bin/starship ]]; then
    echo "Already exists: starship"
    exit 0
fi

echo "Installing starship"
curl -sS https://starship.rs/install.sh | sh -s -- -b ${XDG_LOCAL_HOME}/bin

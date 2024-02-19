#/bin/bash

set -eou pipefail

echo "Installing starship"
curl -sS https://starship.rs/install.sh | sh -s -- -b ${XDG_LOCAL_HOME}/bin

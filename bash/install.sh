#/bin/bash

set -eou pipefail

mkdir -p ${XDG_LOCAL_HOME}/bin

${DOTFILES}/conda/install.sh
${DOTFILES}/bat/install.sh
${DOTFILES}/fd/install.sh
${DOTFILES}/fzf/install.sh
${DOTFILES}/lsd/install.sh
${DOTFILES}/starship/install.sh
${DOTFILES}/vivid/install.sh

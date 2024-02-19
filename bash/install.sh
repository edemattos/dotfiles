#/bin/bash

set -eou pipefail

${DOTFILES}/conda/install.sh
${DOTFILES}/bat/install.sh
${DOTFILES}/fd/install.sh
${DOTFILES}/fzf/install.sh
${DOTFILES}/lsd/install.sh
${DOTFILES}/starship/install.sh
${DOTFILES}/vivid/install.sh

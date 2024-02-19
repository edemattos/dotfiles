#/bin/bash

set -euo pipefail

if [[ ! -z $(which brew) ]]; then
    echo "Already exists: Homebrew"
else
    echo "Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
echo "Installing Homebrew packages"
brew bundle install --verbose --file=${DOTFILES}/homebrew/Brewfile

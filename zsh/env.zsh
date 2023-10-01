# NOTE: ZDOTDIR is set in /etc/zshenv

source ${DOTFILES}/bash/env.sh

# brew
export HOMEBREW_PREFIX=${HOMEBREW_PREFIX:-/usr/local}
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_ENV_HINTS=1

# global text editor
export EDITOR=${HOMEBREW_PREFIX}/bin/nano

# zsh
export HISTFILE=${ZDOTDIR}/.zsh_history

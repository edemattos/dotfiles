export DOTFILES=${HOME}/dotfiles

# load env variables, aliases and plugins
source ${DOTFILES}/bash/env.sh
source ${DOTFILES}/bash/fzf.sh
source ${DOTFILES}/bash/alias.sh

# load additional non-versioned local variables
if [[ -f ${XDG_LOCAL_HOME}/.bashrc ]]; then
    source ${XDG_LOCAL_HOME}/.bashrc
fi

# prompt
eval "$(starship init bash)"

# alacritty always spawns new instance in previous directory
cd ${HOME} && clear

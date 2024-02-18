export DOTFILES=${HOME}/dotfiles

# prompt
eval "$(starship init zsh)"

# load env variables, aliases and plugins
source ${ZDOTDIR}/env.zsh
source ${ZDOTDIR}/fzf.zsh
source ${ZDOTDIR}/alias.zsh
source ${ZDOTDIR}/plugins.zsh

# load additional non-versioned local variables
if [[ -f ${XDG_LOCAL_HOME}/.zshrc ]]; then
    source ${XDG_LOCAL_HOME}/.zshrc
fi

# alacritty always spawns new instance in previous directory
cd ${HOME} && clear

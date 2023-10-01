export DOTFILES=${HOME}/dotfiles

# prompt
eval "$(starship init bash)"

# load env variables, aliases and plugins
source ${DOTFILES}/bash/env.sh
source ${DOTFILES}/bash/fzf.sh
source ${DOTFILES}/bash/alias.sh

# load additional non-versioned local variables
if [[ -f ${XDG_LOCAL_HOME}/.bashrc ]]; then
    source ${XDG_LOCAL_HOME}/.bashrc
fi

# create subshell for tmux
launch_tmux

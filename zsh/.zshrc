# prompt
eval "$(starship init zsh)"

# load env variables, aliases and plugins
source ${ZDOTDIR}/env.zsh
source ${ZDOTDIR}/fzf.zsh
source ${ZDOTDIR}/alias.zsh
source ${ZDOTDIR}/plugins.zsh

# create subshell for tmux
launch_tmux

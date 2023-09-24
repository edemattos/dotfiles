# prompt
eval "$(starship init zsh)"

# load env variables, aliases and plugins
source ${ZDOTDIR}/env.zsh
source ${ZDOTDIR}/fzf.zsh
source ${ZDOTDIR}/alias.zsh
source ${ZDOTDIR}/plugins.zsh

# start tmux session automatically when using Alacritty (i.e. not VSCode)
# explicitly disabled for native Terminal app and existing tmux sessions
# https://unix.stackexchange.com/questions/43601#comment991939_113768
if command -v tmux &> /dev/null && \
    [[ ${TERM} == "alacritty" && ! ${TERM} =~ @(screen|tmux) || ! -z ${ALACRITTY_WINDOW_ID} ]] && \
    [[ ${TERM_PROGRAM} != @("vscode"|"Apple_Terminal"|"tmux") ]] && \
    [[ -z ${TMUX} ]] && [[ -n "${PS1}" ]]; then
    exec tmux new-session -A -s session
fi

alias c="clear"
alias cbc="pbcopy"  # [c]lip[b]oard[c]opy (e.g. echo "hi" | cbc)
alias cbp="pbpaste" # [c]lip[b]oard[p]aste
alias e="echo"
alias n="nano"
alias ssh="TERM=xterm-256color ssh"
alias trim="awk '{\$1=\$1;print}'"
alias which="which -p"
# create and navigate into a new directory
take() {
    mkdir -p $1
    cd $1
}

# ls -> lsd
alias lsd="lsd --group-dirs first"
alias ls="lsd"
alias sl="lsd"
alias l="lsd"
alias la="lsd -A"
alias al="la"
alias ll="lsd -lh"
alias lah="lsd -lAh"
alias lt="lsd --tree"
cx () {
    cd "$@" && ls
}

# mamba (conda)
alias envc="mamba env create"
alias envu="mamba env update"
alias envd="mamba deactivate"
envfzf () {  # fuzzy find mamba environments
    selection=(
        $(
            mamba env list |
            sed 's/\*/ /;1,2d' |
            xargs -I {} bash -c '
                name_path=( {} );
                py_version=( $(${name_path[1]}/bin/python --version) );
                echo ${name_path[0]} ${py_version[1]} ${name_path[1]}
            ' |
            column -t |
            fzf --preview-label=" mamba list " \
                --preview=$'
                    mamba list -n {1} | tail -n +4 | cut -d " " -f 1
                ' |
            cut -d " " -f 1
        )
    )
    echo "${selection}"
}
enva () {  # fuzzy find mamba environments and activate
    if [[ ! -z "$1" ]]; then selection="$1"; else selection=$(envfzf); fi
    [[ -n "${selection}" ]] && mamba activate "${selection}"
}
envr () {  # fuzzy find mamba environments and remove
    if [[ ! -z "$1" ]]; then selection="$1"; else selection=$(envfzf); fi
    [[ -n "${selection}" ]] && mamba env remove --name "${selection}"
}

# docker
alias d="docker"
alias dc="docker compose"
dprune() {
    docker image prune -f
    docker builder prune -f
}

# # fzf (USE ALT + C INSTEAD)
# cdf() {  # fuzzy find directory name and cd directly into it
#     # search home dir by default, otherwise use specified dir
#     if [[ ! -z "$1" && -d "$1" ]]; then
#         search_dir="${1}"
#     else
#         search_dir=~
#     fi
#     destination=$(fd --type directory . ${search_dir} | fzf)
#     if [[ ! -z ${destination} ]]; then cd ${destination}; fi
# }

# git
cdg() {  # cd to the root directory of a git repository
    dir=$(git rev-parse --show-toplevel 2> /dev/null)
    status_code=$?
    if [[ ${status_code} -eq 0 ]]; then
        cd ${dir}
    else
        return ${status_code}
    fi
}
git_main_branch() {
  command git rev-parse --git-dir &>/dev/null || return
  local ref
  for ref in refs/{heads,remotes/{origin,upstream}}/{main,trunk,mainline,default}; do
    if command git show-ref -q --verify $ref; then
      echo ${ref:t}
      return
    fi
  done
  echo master
}
alias ga="git add"
alias gb="git branch"
alias gbd="git branch --delete"
alias gc="git commit"
alias gca="git commit --amend"
alias gcane="git commit --amend --no-edit"
alias gcm="git commit --message"
alias gcl="git clone --recurse-submodules"
alias gco="git checkout"
alias gcom="git checkout $(git_main_branch)"
alias gd="git diff"
alias gl="git log --graph --pretty=format:'%C(yellow)%h%Creset %s %Cgreen(%cr) %C(blue)<%an>%Creset%Cred%d%Creset' --abbrev-commit"
alias gst="git status"

# tmux
launch_tmux() {
    # start tmux session automatically when using Alacritty (i.e. not VSCode)
    # explicitly disabled for native Terminal app and existing tmux sessions
    # https://unix.stackexchange.com/questions/43601#comment991939_113768
    [[ ! -z $1 ]] && session_name=$1 || session_name="main"
    if command -v tmux &> /dev/null && \
        [[ ${TERM} == "alacritty" && ! ${TERM} =~ @(screen|tmux) || ! -z ${ALACRITTY_WINDOW_ID} ]] && \
        [[ ${TERM_PROGRAM} != @("vscode"|"Apple_Terminal"|"tmux") ]] && \
        [[ -z ${TMUX} ]] && [[ -n "${PS1}" ]]; then
        tmux new -A -s ${session_name}
    fi
}
alias t="launch tmux"
alias tns="tmux new -s"
alias tas="tmux attach -t"
alias tks="tmux kill-session -t"
alias tls="tmux ls"

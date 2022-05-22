# zsh edit command in text editor with ctrl-e
# autoload edit-command-line; zle -N edit-command-line
# bindkey '^e' edit-command-line

# zsh autocomplete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# zsh plugins
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source ${ZDOTDIR}/dirhistory/dirhistory.plugin.zsh

# zsh-history-substring-search
source /opt/homebrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# zsh-auto-notify
# source ${ZDOTDIR}/zsh-auto-notify/auto-notify.plugin.zsh
# AUTO_NOTIFY_IGNORE+=("bat tmux")

# zsh-you-should-use
# source ${ZDOTDIR}/zsh-you-should-use/you-should-use.plugin.zsh
# export YSU_IGNORED_ALIASES=("n")
# export YSU_MESSAGE_POSITION="before"
# export YSU_MESSAGE_FORMAT="$(tput setaf 1)Hint: use %alias_type '%alias'$(tput sgr0)"

# zsh-syntax-highlighter (this plugin must be at the end of .zshrc)
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIST_HIGHLIGHTERS=(main brackets)
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]='none'
ZSH_HIGHLIGHT_STYLES[unknown-token]='none'

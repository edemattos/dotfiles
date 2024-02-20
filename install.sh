#/bin/bash

set -eou pipefail

DOTFILES=$(cd -- "$(dirname -- ${BASH_SOURCE[0]})" &> /dev/null && pwd)
WORKDIR=$(pwd) && cd ${DOTFILES}
source ${DOTFILES}/bash/xdg.sh
export DOTFILES

# load shell configuration
function get_versioned_rc { echo "${DOTFILES}/${1}/.${1}rc"; }
if [[ "${SHELL}" == "/bin/zsh" ]]; then
    versioned_rc=$(get_versioned_rc "zsh")
elif [[ "${SHELL}" == "/bin/bash" ]]; then
    versioned_rc=$(get_versioned_rc "bash")
    bashrc="${HOME}/.bashrc"
    if [[ ! -f ${bashrc} ]]; then ln -s ${versioned_rc} ${bashrc}; fi
fi

# configure symbolic links
for app in alacritty bat conda fzf lsd nano python starship tmux vivid wget zsh; do
    symlink=${XDG_CONFIG_HOME}/${app}
    if [[ ! -L ${symlink} ]]; then ln -s ${DOTFILES}/${app} ${symlink}; fi
done

if [[ "${OSTYPE}" == *"darwin"* ]]; then  # macOS

    # configure ZDOTDIR in /etc/zshenv
    if [[ -z ${ZDOTDIR} ]]; then
        echo 'export ZDOTDIR="$HOME"/.config/zsh' | sudo tee -a /etc/zshenv
    fi

    ${DOTFILES}/homebrew/install.sh

elif [[ "${OSTYPE}" == *"linux"* ]]; then  # linux

    ${DOTFILES}/bash/install.sh

fi

# clone submodules
git submodule update --init --recursive

# configure and clean up conda installation
mamba init "$(basename "${SHELL}")" > /dev/null
local_rc="${XDG_LOCAL_HOME}/$(basename .${versioned_rc})"
# remove existing conda initialization from local rc file
sed -i '/# >>> conda initialize >>>/,/# <<< conda initialize <<</d' ${local_rc}
# copy new conda initialization to local rc file
sed -n '/# >>> conda initialize >>>/,/# <<< conda initialize <<</p' ${versioned_rc} >> ${local_rc}
# remove conda initialization from versioned rc file
git checkout ${versioned_rc} 2> /dev/null

# silence login messages
touch ~/.hushlogin

# return to original working directory
cd ${WORKDIR}
echo "Restart the shell for changes to take effect."

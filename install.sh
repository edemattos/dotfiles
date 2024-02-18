#/bin/bash

set -eou pipefail

DOTFILES=$(cd -- "$(dirname -- ${BASH_SOURCE[0]})" &> /dev/null && pwd)
WORKDIR=$(pwd) && cd ${DOTFILES}

# load shell configuration
if [[ "${SHELL}" == "/bin/zsh" ]]; then
    shell="zsh"
elif [[ "${SHELL}" == "/bin/bash" ]]; then
    shell="bash"
fi
versioned_rc="${DOTFILES}/${shell}/.${shell}rc"
source ${versioned_rc}

if [[ "${OSTYPE}" == *"darwin"* ]]; then  # macOS

    # configure ZDOTDIR in /etc/zshenv
    if [[ -z ${ZDOTDIR} ]]; then
        echo 'export ZDOTDIR="$HOME"/.config/zsh' | sudo tee -a /etc/zshenv
    fi

    # homebrew
    if [[ ! -z $(which brew) ]]; then
        echo "Already installed: Homebrew"
    else
        echo "Installing Homebrew"
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    echo "Installing Homebrew packages"
    brew bundle install --verbose --file=${DOTFILES}/homebrew/Brewfile

elif [[ "${OSTYPE}" == *"linux"* ]]; then  # linux

    # conda
    if [[ ! -z $(which mamba) ]]; then
        echo "Already installed: conda"
    else
        echo "Installing conda"
        wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh &&
        miniforge=$(find . -type f -name '*Miniforge3*')
        bash ${miniforge} -b -p ${XDG_LOCAL_HOME}/miniforge3 && rm ${miniforge}
    fi

fi

# clone submodules
# git submodule update --init --recursive

# configure symbolic links
for app in alacritty bat conda fzf lsd nano python ripgrep tmux vivid wget zsh; do
    symlink=${XDG_CONFIG_HOME}/${app}
    if [[ ! -L ${symlink} ]]; then ln -s ${symlink} ${DOTFILES}/${app}; fi
done
symlink=${XDG_CONFIG_HOME}/starship.toml
if [[ ! -L ${symlink} ]]; then ln -s ${symlink} ${DOTFILES}/starship/starship.toml; fi

# conda
echo "Cleaning up conda installation"
conda init "$(basename "${SHELL}")" > /dev/null
local_rc="${XDG_LOCAL_HOME}/.${shell}rc"
# remove existing conda initialization from local rc file
sed -i '/# >>> conda initialize >>>/,/# <<< conda initialize <<</d' ${local_rc}
# copy new conda initialization to local rc file
sed -n '/# >>> conda initialize >>>/,/# <<< conda initialize <<</p' ${versioned_rc} >> ${local_rc}
# remove conda initialization from versioned rc file
git checkout ${versioned_rc} > /dev/null

# silence login messages
touch ~/.hushlogin

# return to original working directory
cd ${WORKDIR}
echo "Restart the shell for changes to take effect."

#/bin/bash

set -eou pipefail

echo "Installing fzf"

git clone git@github.com:junegunn/fzf.git ${XDG_LOCAL_HOME}/fzf
${XDG_LOCAL_HOME}/fzf/install --bin --no-update-rc
mv ${XDG_LOCAL_HOME}/fzf/bin/fzf ${XDG_LOCAL_HOME}/fzf/bin/fzf-tmux ${XDG_LOCAL_HOME}/bin/
rm -rf ${XDG_LOCAL_HOME}/fzf

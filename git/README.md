# Git

See [git-config](https://git-scm.com/docs/git-config#FILES) for more information
about configuration file options.

## :gear: Installation

Symlink the versioned options.

```bash
mkdir -p ${XDG_CONFIG_HOME}/git &&
ln -s ${DOTFILES}/git/gitconfig ${XDG_CONFIG_HOME}/git/config
```

Create a local file for system-specific (global) configurations.

```bash
touch ${HOME}/.gitconfig
```

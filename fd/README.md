# fd

The `ignore` file requires absolute paths, so directories should be specified in
a local configuration.

```bash
mkdir -p ${XDG_LOCAL_HOME}/fd && nano ${XDG_LOCAL_HOME}/fd/ignore
```

Symlink the configuration into place.

```bash
ln -s ${XDG_LOCAL_HOME}/fd ${XDG_CONFIG_HOME}/fd
```

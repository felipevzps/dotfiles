# mybash

### usage

```bash
# clone this repo
git clone https://github.com/felipevzps/mybash.git

# move .tmux.conf to homedir after cloning
cd ~/ && cp mybash/.tmux.conf . 

# download plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# load tmux
tmux source-file ~/.tmux.conf
```

### tmux cheatsheet

```bash
# start new
tmux

# start new with session name
tmux new -s myname

# attach to session
tmux a

# attach to named session
tmux a -t myname

# list sessions
tmux ls

# kill session
tmux kill-session -t myname

# vertical split
Ctrl+b %

# horizontal split
Ctrl+b "
```

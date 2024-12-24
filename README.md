# dotfiles

### tmux 

```bash
# move .tmux.conf to home after cloning
cd ~/ && cp ~/dotfiles/.tmux.conf . 

# download plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# load tmux
tmux source-file ~/.tmux.conf
```

### nvim 

```bash
# move nvim to ~/.config after cloning
cd ~/.config && cp -r ~/dotfiles/nvim . 

# install ripgrep (for telescope)
https://github.com/BurntSushi/ripgrep

# load nvim (in ~/.config) and install plugins
nvim .
:Lazy install
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

# create new window in active session
Ctrl+b c

# rename active window (new window) in active session
Ctrl+b ,

# delete active window 
Ctrl+b d

# change window in same session
Ctrl+b 1 # go to window 1
Ctrl+b 2 # go to window 2

# vertical split
Ctrl+b %

# horizontal split
Ctrl+b "
```

### nvim cheat sheet

```bash
# find files (telescope)
<leader>ff

# grep files (telescope)
<leader>fg

# jump to project view (nvim)
<leader>pv

# jump to right window  
"<C-w>l"

# jump to left window  
"<C-w>h"

# jump to top window 
"<C-w>k"

# jump to bottom window  
"<C-w>j"
```

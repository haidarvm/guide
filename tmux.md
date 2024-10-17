# tmux kill session
tmux kill-session

# tmux restore single session
tmux a

# tmux list session
tmux ls
tmux attach-session -t 0

# exit tmux 
ctrl + b d

# add mouse  add ~/.tmux.conf
setw -g mouse on

# ressurect
git clone https://github.com/tmux-plugins/tmux-resurrect ~/tmux-plugins

# Add this line to the bottom of .tmux.conf:
run-shell ~/tmux-plugins/resurrect.tmux

# add plugin into .tmux.conf
set -g @plugin 'tmux-plugins/tmux-resurrect' 


# command


# create window
Ctrl + b c
# next win
Ctrl + b n
# rename win
ctrl + b ,
# close  current
ctrl + b &

# tmux plugin
https://github.com/tmux-plugins/tpm

# install tmux plugin / theme
Ctrl + B + I 


# tmux theme  list
https://github.com/rothgar/awesome-tmux

# tmux gruvbox
https://github.com/egel/tmux-gruvbox

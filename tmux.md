# tmux kill session
tmux kill-session

# add mouse  add ~/.tmux.conf
setw -g mouse on

# ressurect
git clone https://github.com/tmux-plugins/tmux-resurrect ~/tmux-plugins

# Add this line to the bottom of .tmux.conf:
run-shell ~/tmux-plugins/resurrect.tmux

# add plugin into .tmux.conf
set -g @plugin 'tmux-plugins/tmux-resurrect' 


# command


# create windows
Ctrl + b c
# next win
Ctrl + b n
# rename win
ctrl + b ,
# close  current
ctrl + b &

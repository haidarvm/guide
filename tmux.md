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
set -g escape-time 0

bind-key -T copy-mode-vi Enter send-keys -X copy-pipe-and-cancel "wl-copy"
bind-key -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "wl-copy" #vi style copy
bind-key -T copy-mode-vi Space send-keys -X copy-pipe-and-cancel "wl-copy"


# ressurect
git clone https://github.com/tmux-plugins/tmux-resurrect ~/tmux-plugins

# Add this line to the bottom of .tmux.conf:
run-shell ~/tmux-plugins/resurrect.tmux
run '~/.tmux/plugins/tpm/tpm'

# add plugin into .tmux.conf
set -g @plugin 'tmux-plugins/tmux-resurrect' 

# install plugin
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'egel/tmux-gruvbox'
set -g @tmux-gruvbox 'dark' # or 'light'


# tmux convert to vertical / horizontal swap
ctrl + b space


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


# tmux conf
setw -g mouse on
bind-key -T copy-mode-vi Enter send-keys -X copy-pipe-and-cancel "wl-copy"
bind-key -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "wl-copy" #vi style copy
bind-key -T copy-mode-vi Space send-keys -X copy-pipe-and-cancel "wl-copy"

set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
#set -g @plugin "arcticicestudio/nord-tmux"
#set -g @plugin 'o0th/tmux-nova'
#set -g @plugin 'catppuccin/tmux'
set -g @plugin 'egel/tmux-gruvbox'
set -g @tmux-gruvbox 'dark' # or 'light'
#set -g @tmux2k-theme 'onedark'

run '~/.tmux/plugins/tpm/tpm'




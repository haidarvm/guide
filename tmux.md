# tmux kill session
tmux kill-session

# ressurect
git clone https://github.com/tmux-plugins/tmux-resurrect ~/tmux-plugins

# Add this line to the bottom of .tmux.conf:
run-shell ~/tmux-plugins/resurrect.tmux


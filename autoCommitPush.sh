#!/bin/bash
# BismillAh
set -e  # stop on errors

cd /home/haidar/guide || exit 1

# First, make sure we’re on the correct branch
branch="main"   # or master, check with: git branch

# Fetch remote changes
/usr/bin/git fetch origin "$branch"

# Check if remote has new commits
LOCAL=$(/usr/bin/git rev-parse "$branch")
REMOTE=$(/usr/bin/git rev-parse "origin/$branch")

if [ "$LOCAL" != "$REMOTE" ]; then
    echo "Remote has new commits, pulling..."
    /usr/bin/git pull --rebase origin "$branch"
else
    echo "No new remote commits"
fi

# Then handle local changes
if ! /usr/bin/git diff --quiet || ! /usr/bin/git diff --cached --quiet; then
    /usr/bin/git add -A
    /usr/bin/git commit -m "Daily update"
    /usr/bin/git push origin "$branch"
else
    echo "No local changes"
fi


#*/25 * * * *  XDG_RUNTIME_DIR=/run/user/$(id -u) /home/haidar/guide/autoCommitPush.sh
#*/10 * * * * cd /home/haidar/guide && /bin/bash /home/haidar/guide/autoCommitPush.sh >> /home/haidar/autoCommitPush.log 2>&1

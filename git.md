# create rsa
ssh-keygen -t rsa -b 4096 -C "haidarvm@gmail.com"
git config --global user.name "haidarvm"
git config --global user.email "haidarvm@gmail.com"
git pull origin master
git push origin master

# reset to commit version
git reset --hard 7fa4976


# begin git
git branch exercise6
git checkout exercise6


# common
git add .
git commit -am 'exercise6 belajar variable'
git push


# merge to master
git checkout master
git merge exercise6
git push origin master


# ignore this configuration if not working add this
git rm -r  --cached .
git add .
git commit -m 'fixed ignore'


# create branch
git branch
git branch production


#remove big file
git filter-branch --index-filter 'git rm --cached --ignore-unmatch a b' HEAD
git filter-branch --tree-filter 'rm -f DVD-rip' HEAD

#merge to master
git checkout master
git pull origin master
git merge test
git push origin master

#git add master to branch
git checkout production
git checkout master app/controller/pg.php

# remove untrack files
git clean -n -d

# beware confirm deletion
git clean -d -f

# remove with folder # if hacked, virus, malware or unknow changes
git clean -f -d

#change branch
git fetch
git checkout branch

git diff

#check diff  haven't git add yet
git diff myfile.txt

#check changes
git diff HEAD HEAD^

#already git add
git diff --cached myfile.txt



git show HEAD~1


#create existing to git
echo "# simple-php-template" >> README.md
git init
git add README.md
git commit -am "first commit"
git remote add origin git@github.com:haidarvm/reponya
git pull 
git push 


git show HEAD~1


#git revert one file only
git checkout HEAD -- composer.json


#git check changes
git diff
git diff --cached


# add one more ssh
You can create one more key pair, say id_rsa_personal.pub, and add it to the Github account.

Next, create/edit the .ssh/config file.

# Default GitHub
Host github.com
  HostName github.com
  User git
  IdentityFile ~/.ssh/id_rsa

Host github-public
  HostName github.com
  User git
  IdentityFile ~/.ssh/id_rsa_public

Host github-personal
  HostName github.com
  User git
  IdentityFile ~/.ssh/id_rsa_personal
The above file will help you to use more than one Github account. For background info, refer to the answers to this question.

Next, you will need to alter your .git/config remote url to point to:

git@github-personal:<gh_username>/<gh_reponame>.git







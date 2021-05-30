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

#buat file baru exercise6.py input coding nya lalu save
#test running file .py nya di terminal
python exercise6.py

#jika ada error maka Format document pastikan tidak ada yg merah2


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

#change branch
git fetch
git checkout *branch

git diff



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





























UwaisArfa003026
b1smill4h@g17003026


Oh yaa, Jazakallah Nuhun jga saran nya.Ku dah konsumsi Combo Herbal ampir 1 minggu Alhamdulillah
- Habbats Oil
- Zaitun Oil
- Madu
- Propolis Trigona 

+ Murotal Al Baqarah ... mulai berasa banget berkurang batuk2 & berdehem2, nyeri leher berkurang bgt
dan bersin2 tiap pagi sudah jarang 🙏👍😊

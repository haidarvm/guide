# edit
~/.vimrc

set number
set paste
set nocompatible
syntax on

#  find
/findhere

# find incase sensitive
/\ccopyright 
/copyright\c 
/copyri\cght

# set copy paste
:set paste
# copy one line copy current line, 
yy
3yy
y%
y^
yiw

# copy multiple line
v
j
+y


# paste paste before cursor, paste after cursor
P
p

# go to line 
:27

# cut line
dd


# delete line
dd
3dd
d$

# delete all
d G

# delete start from cursor
d$

# clear last search
:noh

# find and replace , current line, replace all, replace all in file, find and delete all
:s/foo/bar/
:s/foo/bar/g

# this to replace all
:%s/foo/bar/g
:s/foo//g

# undo 
uu

# redo
ctrl+r

# go end
shift+g


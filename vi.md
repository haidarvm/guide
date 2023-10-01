#  find
/findhere

# find incase sensitive
/\ccopyright 
/copyright\c 
/copyri\cght


# copy one line copy current line, 
yy
3yy
y%
y^
yiw

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

# find and replace , current line, replace all, replace all in file, find and delete all
:s/foo/bar/
:s/foo/bar/g
:%s/foo/bar/g
:s/foo//g

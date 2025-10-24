# select user
#!/usr/bin/env bash

#echo "Enter pwd"
#read pwd
#mysql -u root -p$pwd --execute="SELECT User, Host FROM mysql.user"




#!/usr/bin/env bash

echo  "Enter Your root_pass: "
read -s root_pass 
echo  "Enter Your user_pass: "
read -s user_pass 
read -p "Enter Your Database: "  new_database
mysql -u root -p$root_pass --execute="CREATE DATABASE $new_database;";
mysql -u root -p$root_pass --execute="CREATE USER '$new_database'@'localhost' IDENTIFIED BY '$user_pass'";
mysql -u root -p$root_pass --execute="GRANT ALL ON $new_database.* TO '$new_database'@'localhost';"
mysql -u root -p$root_pass --execute="flush privileges';"
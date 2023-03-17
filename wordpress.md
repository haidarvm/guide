#reset password
head -c 23 /dev/urandom | base64 | tr -d '/+=' | cut -c1-23

mysql -u root -p

select ID,user_login,user_pass from wp_users;

update wp_users set user_pass = MD5('wAXMRV05x8iMaAoW5BsNewa') where ID = 3;
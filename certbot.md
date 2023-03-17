sudo /usr/bin/certbot-auto renew --dry-run


# Certonly Tobias using acme.sh

certbot certonly --standalone -d example.site -d www.example.site -m haidarvm@gmail.com --agree-tos


sudo certbot --nginx -d www.example.com -d example.com   


sudo add-apt-repository ppa:certbot/certbot
sudo apt install python-certbot-nginx


# update email 
sudo certbot update_account --email yourname@example.com


# remove certificates
# Show the list of certificates
sudo certbot certificates
sudo certbot delete --cert-name $mydomain

#check expire date certbot
nmap -p 443 --script ssl-cert gnupg.org

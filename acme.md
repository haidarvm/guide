# install
curl https://get.acme.sh | sh -s email=my@example.com


vim /etc/acme-client.conf
authority letsencrypt {
        api url "https://acme-v02.api.letsencrypt.org/directory"
        account key "/etc/acme/letsencrypt-privkey.pem"
}

authority letsencrypt-staging {
        api url "https://acme-staging.api.letsencrypt.org/directory"
        account key "/etc/acme/letsencrypt-staging-privkey.pem"
}

domain example.com {
       alternative names { www.example.com }
       domain key "/etc/ssl/private/example.com.key"
       domain certificate "/etc/ssl/example.com.crt"
       domain full chain certificate "/etc/ssl/example.com.fullchain.pem"
       sign with letsencrypt
}
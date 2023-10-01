# install new
mkdir -p tools/php-cs-fixer
composer require --working-dir=tools/php-cs-fixer friendsofphp/php-cs-fixer

# install old

wget https://cs.symfony.com/download/php-cs-fixer-v2.phar -O php-cs-fixer
sudo chmod a+x php-cs-fixer
sudo mv php-cs-fixer /usr/local/bin

# Globally
composer global require friendsofphp/php-cs-fixer
export PATH="$PATH:$HOME/.composer/vendor/bin"

# Globally update
sudo php-cs-fixer self-update



# set visual studio code
"php-cs-fixer.config": "/var/www/public_html/guide/php/config.php_cs"


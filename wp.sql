-- wordpress chmod php
find . -type d -exec chmod 755 {} \;  # Change directory permissions rwxr-xr-x
find . -type f -exec chmod 640 {} \;  # Change file permissions rw-r--r--

-- disable xmlrpc in rewrite ols
RewriteRule ^/(xmlrpc\.php|wp-trackback\.php) - [F,L,NC]


-- wp-config.php hardening
define('DISABLE_WP_CRON', true);
define('WP_DEBUG', false );
define('WP_DEBUG_DISPLAY', false );
@ini_set( 'display_errors', 0 );
define('ALLOW_UNFILTERED_UPLOADS', false);
define('DISALLOW_FILE_EDIT', true );
define('DISALLOW_FILE_MODS',true);
#define('FS_METHOD','direct');


-- htaccess
# BEGIN WordPress
RewriteEngine On
RewriteBase /
RewriteRule ^/index.php$ - [L]
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule . /index.php [L]
# END WordPress


UPDATE wpw4_users SET user_pass= MD5('123Bismillah') WHERE ID = 1;


wp user update 1 --user_pass=123Bismillah

#reset password
head -c 23 /dev/urandom | base64 | tr -d '/+=' | cut -c1-23

mysql -u root -p

select ID,user_login,user_pass from wp_users;

update wp_users set user_pass = MD5('wAXMRV05x8iMaAoW5BsNewa') where ID = 3;

-- disable json
add_filter( 'rest_authentication_errors', 'wp_snippet_disable_rest_api' );
	function wp_snippet_disable_rest_api( $access ) {
	  return new WP_Error( 'rest_disabled', __('The WordPress REST API has been disabled.'), array( 'status' => rest_authorization_required_code()));
	}
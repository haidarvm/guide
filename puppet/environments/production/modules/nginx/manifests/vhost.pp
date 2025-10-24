define nginx::vhost (
  String $server_name,
  String $root_dir,
) {

  file { "/etc/nginx/conf.d/${server_name}.conf":
    ensure  => file,
    content => template('nginx/vhost.conf.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    notify  => Service['nginx'],
  }

}


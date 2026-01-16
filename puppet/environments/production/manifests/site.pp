
service { 'nginx':
  ensure     => running,
  enable     => true,
  hasrestart => true,
  hasstatus  => true,
}

nginx::vhost { 'invbio':
  server_name => 'invbio.test',
  root_dir    => '/var/www/invbio',
}

nginx::vhost { 'projectx':
  server_name => 'projectx.test',
  root_dir    => '/var/www/projectx',
}

nginx::vhost { 'profile':
  server_name => 'profile.test',
  root_dir    => '/var/www/profile',
}

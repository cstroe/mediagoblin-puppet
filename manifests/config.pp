class mediagoblin::config {
  file { 'mediagoblin_local_config':
    ensure  => 'present',
    path    => "${::mediagoblin::install_path}/mediagoblin_local.ini",
    content => 'puppet:///mediagoblin/mediagoblin_local.ini',
    notify  => Exec['mediagoblin_update_database'],
  }

  exec { 'mediagoblin_update_database':
    command     => "${::mediagoblin::install_path}/bin/gmg dbupdate",
    cwd         => $::mediagoblin::install_path,
    environment => "HOME=${::mediagoblin::homedir_path}",
    user        => 'mediagoblin',
    path        => ['/bin', '/usr/bin'],
  }
}

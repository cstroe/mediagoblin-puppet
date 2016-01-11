class mediagoblin::code {
  class { git:
    svn => false,
    gui => false,
  }

  file { 'mediagoblin_install_path':
    ensure  => directory,
    path    => $::mediagoblin::install_path,
    owner   => 'mediagoblin',
    group   => 'www-data',
    recurse => true,
  }
}

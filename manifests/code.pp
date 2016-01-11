class mediagoblin::code {
  include git

  file { 'mediagoblin_install_path':
    ensure  => directory,
    path    => $::mediagoblin::install_path,
    owner   => 'mediagoblin',
    group   => 'www-data',
    recurse => true,
  }
}

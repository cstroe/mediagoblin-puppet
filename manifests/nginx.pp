class mediagoblin::nginx(
  $nginx_dir                = '/etc/nginx',
  $domain                   = 'media.onawh.im',
  $mediagoblin_install_path = $::mediagoblin::install_path,
) {

  file { 'mediagoblin_nginx_config':
    ensure  => 'present',
    path    => "${nginx_dir}/conf.d/mediagoblin.conf",
    content => template('mediagoblin/mediagoblin.conf.erb'),
  }
}

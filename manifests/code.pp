class mediagoblin::code(
  $mediagoblin_git_repo   = 'git://git.savannah.gnu.org/mediagoblin.git',
  $mediagoblin_git_branch = 'stable',
) {
  class { git:
    svn => false,
    gui => false,
  }

  git::repo { 'mediagoblin_git_repo':
    path   => $::mediagoblin::install_path,
    source => $mediagoblin_git_repo,
    branch => $mediagoblin_git_branch,
    update => true,
    owner   => 'mediagoblin',
    group   => 'www-data',
  }

  exec { 'mediagoblin_environment_setup':
    command     => "${::mediagoblin::install_path}/bootstrap.sh && ${::mediagoblin::install_path}/configure && make",
    creates     => "${::mediagoblin::install_path}/mediagoblin.ini",
    cwd         => $::mediagoblin::install_path,
    path        => ['/bin', '/usr/bin'],
    require     => Git::Repo['mediagoblin_git_repo'],
    environment => ["HOME=${::mediagoblin::homedir_path}"],
    user        => 'mediagoblin',
    notify      => Exec['mediagoblin_install_flup'],
  }

  file { 'mediagoblin_upload_dir':
    ensure  => 'directory',
    path    => "${::mediagoblin::install_path}/user_dev",
    owner   => 'mediagoblin',
    group   => 'www-data',
    mode    => '0750',
    require => Exec['mediagoblin_environment_setup'],
  }

  exec { 'mediagoblin_install_flup':
    command     => "${::mediagoblin::install_path}/bin/easy_install flup",
    environment => ["HOME=${::mediagoblin::homedir_path}"],
    path        => ['/bin', '/usr/bin'],
    user        => 'mediagoblin',
    refreshonly => true,
  }
}

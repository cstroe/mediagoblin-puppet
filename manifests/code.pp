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
    command => "./bootstrap.sh && ./configure && make",
    creates => "${::mediagoblin::install_path}/mediagoblin.ini",
    cwd     => $::mediagoblin::install_path,
    require => File[$::mediagoblin::install_path],
  }
}

class mediagoblin::code(
  $mediagoblin_git_repo   = 'git://git.savannah.gnu.org/mediagoblin.git',
  $mediagoblin_git_branch = 'stable',
) {
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

  git::repo { 'mediagoblin_git_repo':
    path   => $::mediagoblin::install_path,
    source => $mediagoblin_git_repo,
    branch => $mediagoblin_git_branch,
    update => true,
    notify => File['mediagoblin_install_path'],
  }
}

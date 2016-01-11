class mediagoblin(
  $install_path = '/opt/mediagoblin',
  $homedir_path = '/var/lib/mediagoblin',
) {
  include mediagoblin::database

  ensure_packages([
    'automake',
    'git-core',
    'nginx',
    'python',
    'python-dev',
    'python-imaging', 
    'python-lxml',
    'python-virtualenv',
  ], { 'ensure' => 'installed' })

  user { 'mediagoblin_user':
    ensure     => 'present',
    name       => 'mediagoblin',
    home       => $homedir_path,
    comment    => 'GNU MediaGoblin system account',
    managehome => true,
    groups     => 'www-data',
    system     => true,
  }

  contain mediagoblin::code
}

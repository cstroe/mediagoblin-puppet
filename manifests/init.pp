class mediagoblin {
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
}

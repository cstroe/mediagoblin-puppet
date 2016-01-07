class mediagoblin {
  package { ['python-lxml', 'python-imaging', 'python-virtualenv']:
    ensure => installed,
  }
}

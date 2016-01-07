class mediagoblin {
  package { ['python-lxml', 'python-imaging', 'python-virtualenv']:
    ensure => installed,
  }

  package { ['nodejs-legacy', 'npm']:
    ensure => installed,
  }
}

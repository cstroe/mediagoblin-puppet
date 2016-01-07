class mediagoblin::database {
  class { 'postgresql::server': }

  postgresql::server::db { 'mediagoblin':
    user     => 'mediagoblin',
    password => postgresql_password('mediagoblin', 'mediagoblin'),
  }
}

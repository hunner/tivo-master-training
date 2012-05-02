define services::service (
  $port,
  $protocols = ['tcp','udp'],
  $comments = '',
  $aliases = undef,
) {
  file { "${services::basedir}/services.d/${port}-${name}":
    ensure  => present,
    notify  => Exec['rebuild-services'],
    content => template('services/service.erb'),
  }
}

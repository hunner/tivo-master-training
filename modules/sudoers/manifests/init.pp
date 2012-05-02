class sudoers($spooldir = '/tmp') {
  $temp_file = "${spooldir}/sudoers"

  File[$temp_file] -> Exec['check sudoers'] -> File['/etc/sudoers']

  File {
    owner  => '0',
    group  => '0',
    mode   => '0440',
  }
  file { $temp_file:
    ensure => present,
    source => 'puppet:///modules/sudoers/sudoers',
  }
  exec { 'check sudoers':
    command   => "visudo -c -f ${temp_file}",
    path      => ['/usr/sbin','/usr/bin'],
    unless    => "diff /etc/sudoers ${temp_file}",
    logoutput => 'on_failure',
  }
  file { '/etc/sudoers':
    ensure  => present,
    source  => $temp_file,
  }
}

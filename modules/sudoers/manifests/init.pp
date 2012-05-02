class apache($port = hiera("port","80","%{subclass}/apache")) {
}

class mysql($port = hiera("port","3306","%{subclass}/mysql")) {
}

:hierarchy:
- %{subclass}/%{calling_module}
- %{subclass}




class sudoers($spooldir = hiera('spooldir')) {
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

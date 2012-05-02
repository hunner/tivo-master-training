class ssh {
  package { 'sshd':
    ensure => present,
    name   => 'openssh-server',
  }
  file { 'sshd_config':
    ensure  => present,
    path    => '/etc/ssh/sshd_config',
    owner   => '0',
    group   => '0',
    mode    => '0600',
    source  => 'puppet:///modules/ssh/sshd_config',
    require => Package['sshd'],
    notify  => Service['sshd'],
  }
  service { 'sshd':
    ensure => running,
    enable => true,
  }
}

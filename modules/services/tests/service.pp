include services
services::service { 'finger':
  port      => '79',
  protocols => ['tcp','udp'],
}
services::service { 'http':
  port     => '80',
  aliases  => ['www','www-http'],
  comments => ['WorldWideWeb HTTP', 'HyperText Transfer Protocol']
}
services::service { 'kerboros':
  port     => '88',
  aliases  => ['kerberos5','krb5'],
  comments => "Kerberos v5",
}

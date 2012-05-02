define usermanagement::user(
  $homedir = 'default_home',
  $group = undef,
) {
  $username = $name

  case $homedir {
    'default_home': {
      $homedir_real = $username ? {
        'root'  => '/root',
        default => "/home/${username}",
      }
    }
    default: {
      $homedir_real = $homedir
    }
  }
  if $group {
    $group_real = $group
  } else {
    $group_real = $username
  }
  file { $homedir_real:
    ensure => directory,
    owner  => $username,
    group  => $group_real,
  }
  if ! defined(Group[$group_real]) {
    group { $group_real:
      ensure => present,
    }
  }
  user { $username:
    ensure => present,
    gid    => $group_real,
    home   => $homedir_real,
  }
}

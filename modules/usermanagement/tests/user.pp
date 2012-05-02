usermanagement::user { 'hunner':
  homedir => '/different/home/hunner',
  group   => 'wheel',
}
usermanagement::user { 'elvis':
  homedir => '/home/elvis', #default
  group   => 'elvis', #default
}
usermanagement::user { 'quux':
}
usermanagement::user { 'root':
  group => 'wheel',
}

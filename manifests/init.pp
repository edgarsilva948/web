class web {

  package { 'apache2':
    ensure => present,
  }
  ->
  file { 'web.conf':
    ensure => file,
    path   => '/etc/apache2/sites-enabled',
    mode   => '0644',
    owner  => 'root',
    group  => 'root',
    source => 'puppet:///modules/web/web.conf',
  }
  ~>
  service { 'apache2':
    ensure => 'running',
    enable => true,
  }
}

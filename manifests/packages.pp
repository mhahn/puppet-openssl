# == Class: openssl::packages
#
# Sets up packages for openssl
class openssl::packages {
  package { 'openssl':
    ensure => present,
  }

  if $::osfamily == 'Debian' {
    package { 'ca-certificates':
      ensure => present,
      before => Package['openssl'],
    }

    exec { 'update-ca-certificates':
      path        => ['/usr/bin', '/usr/sbin', '/usr/local/bin'],
      refreshonly => true,
      require     => Package['ca-certificates'],
    }
  }
}

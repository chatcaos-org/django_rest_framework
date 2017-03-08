exec{"update-locale":
    command => "/usr/sbin/locale-gen pt_BR && /usr/sbin/locale-gen pt_BR.UTF-8 && /usr/sbin/update-locale",
}

file{"/etc/apt/sources.list.d/pgdg.list":
    source => "/tmp/environments/all/conf/pgdg.list",
    owner   => root,
    mode    => "0640",
}

package{"wget":
    ensure => "present",
    require => File["/etc/apt/sources.list.d/pgdg.list"]
}

exec{"pg-repo-key":
    command => "/usr/bin/wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | /usr/bin/apt-key add -",
    user => "root",
    require => Package["wget"],
}

exec { "apt-update":
    command => "/usr/bin/apt-get update",
    user => "root",
    require => Exec["update-locale"],
}

package{["git", "build-essential", "libproj-dev", "gcc", "g++", "libssl-dev", "openssl", "vim"]:
        ensure => "present",
        require => Exec["apt-update"],
}


package{["libgdal1-dev","libgeos-dev","libxml2-dev","libxslt1-dev"]:
        ensure => "present",
        require => Exec["apt-update"],
}


package{["postgresql-9.6","postgresql-server-dev-9.6","postgresql-client-9.6","postgresql-contrib-9.6","libpq-dev"]:
        ensure => "present",
        require => Exec["apt-update"],
}


package{["postgresql-9.6-postgis-2.3","postgresql-9.6-postgis-2.3-scripts","postgresql-9.6-postgis-scripts"]:
        ensure => "present",
        require => Exec["apt-update"],
        notify => Service["postgresql"],
}

user{"postgres":
    ensure => "present",
    password => "postgres",
    require => Package["postgresql-9.6"],
}

file{"/etc/postgresql/9.6/main/pg_hba.conf":
        source => "/tmp/environments/all/conf/pg_hba.conf",
        owner   => postgres,
        group   => postgres,
        mode    => "0640",
    require => Package["postgresql-9.6"],

}

file{"/etc/postgresql/9.6/main/postgresql.conf":
        source => "/tmp/environments/all/conf/postgresql.conf",
        owner   => postgres,
        group   => postgres,
        mode    => "0644",
    require => Package["postgresql-9.6"],

}

service{ "postgresql":
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require => Package["postgresql-9.6"],
}

exec{ "set-postgres-password":
    command => "/usr/bin/psql -c \"alter user postgres with password \'postgres\';\"",
    user => "postgres",
    require => Service["postgresql"],
}

exec{ "create database rest":
    command => "/usr/bin/psql -c \"CREATE DATABASE rest;\"",
    user => "postgres",
    require => Service["postgresql"],
}

package { 'python':
	ensure => present,
	name => "python3.5",
}

package { 'python3-pip':
  ensure => present,
   require => Package["python"],
}

package { 'unittest':
        provider => pip3,
        ensure   => present,
        name     => "unittest2",
        require => Package["python3-pip"],
}

package {'django':
        provider => pip3,
        ensure => present,
        name => "django",
        require => Package["python3-pip"],
}

package {'djangorestframework':
        provider => pip3,
        ensure => present,
        name => "djangorestframework",
        require => Package["python3-pip"],
}

package {'django-filter':
        provider => pip3,
        ensure => present,
        name => "django-filter",
        require => Package["python3-pip"],
}

package {'Markdown':
        provider => pip3,
        ensure => present,
        name => "markdown",
        require => Package["python3-pip"],
}

package {'gunicorn':
        provider => pip3,
        ensure => '19.3.0',
        name => "gunicorn",
        require => Package["python3-pip"],
}

package {'psycopg2':
        provider => pip3,
        ensure => '2.6.1',
        name => "psycopg2",
        require => Package["python3-pip"],
}


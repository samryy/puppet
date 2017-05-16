class setupmod {

## Programs to install

	$setup = [ 'mysql-server', 'mysql-client', 'npm', 'nodejs', 'php7.0', 'libapache2-mod-php', 'php-mysql', 'atom' ]

## Create users

$userlist = [ 'JaakkoK', 'JesseL', 'NiinaK' ]
$password = 'hello'

	user { $userlist:
		ensure	 => 'present',
		managehome => 'true',
		password_max_age => '99999',
		password_min_age => '0',
		groups => 'sudo',
		password => generate('/bin/sh', '-c', "mkpasswd -m sha-512 ${password} | tr -d '\n'"),

	}


## Create all directories 

	file { "/home/${userlist}/public_html":
		ensure => 'directory',
		group  => '1000',
		mode   => '775',
		owner  => '1000',

	}

	file { "/home/${userlist}/programming":
		ensure => 'directory',
		group  => '1000',
		mode   => '775',
		owner  => '1000',

	}

	file { "/home/${userlist}/git":
		ensure => 'directory',
		group  => '1000',
		mode   => '775',
		owner  => '1000',

	}

	package { $setup:
		ensure => 'installed', 
                allowcdrom => 'true',

	}

	package {apache2:
                ensure => 'installed', 
                allowcdrom => 'true',
        }

	file { '/var/www/html/index.html':
		ensure => 'present',
		content => template("setupmod/index.html.erb")
	}
	
## Check for Updates

exec { "apt-update":
		command => "/usr/bin/apt-get update"
	}
		Exec["apt-update"] -> Package <| |>


}


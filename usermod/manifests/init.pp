class usermod {


$setup = [ 'mysql-server', 'mysql-client', 'npm', 'nodejs', 'php7.0', 'libapache2-mod-php', 'php-mysql', ]

$userlist = 'JaakkoK'
$password = 'hello'

	user { $userlist:
		ensure	 => 'present',
		managehome => 'true',
		password_max_age => '99999',
		password_min_age => '0',
		groups => 'sudo',
		password => generate('/bin/sh', '-c', "mkpasswd -m sha-512 ${password} | tr -d '\n'"),

	}
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
		content => template("usermod/index.html.erb")
	}


	

}


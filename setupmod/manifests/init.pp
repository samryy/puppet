class setupmod {

## Programs to install

	$user = 'ubuntu'
	$setup = [ 'mysql-server', 'mysql-client', 'npm', 'nodejs', 'php7.0' ]

## Check for updates

	exec { "apt-update":
		command => "/usr/bin/apt-get update"
	}
		Exec["apt-update"] -> Package <| |>

## Create all directories 

	file { "/home/${user}/public_html":
		ensure => 'directory',
		group  => '1000',
		mode   => '775',
		owner  => '1000',

	}

	file { "/home/${user}/programming":
		ensure => 'directory',
		group  => '1000',
		mode   => '775',
		owner  => '1000',

	}

	file { "/home/${user}/git":
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
		ensure => 'absent'
	}

        file { '/etc/apache2/mods-enabled/php7.0.conf':
                ensure => 'present',
                content => template('setupmod/php.conf.erb')
        }

        file { '/var/www/html/index.php':
                ensure => 'present',
                content => template('setupmod/index.php.erb'),
        }

}


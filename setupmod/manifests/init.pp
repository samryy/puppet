class setupmod {

## Programs to install

	$user = 'sami'
	$setup = [ 'mysql-server', 'mysql-client', 'npm', 'nodejs', 'php7.0', 'libapache2-mod-php', 'php-mysql' ]
	$vhostPath = "/etc/apache2/sites-enabled"
	$title = 'sami'


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
		ensure => 'present',
		content => template('setupmod/index.html.erb')
	}
	
	define apachevhost {
		file { "/etc/apache2/sites-enabled/${title}.conf":
			ensure	=> 'present',
			mode	=> '0644',
			content	=> template("apache/vhost.conf.erb"),
			require => Package['apache'],
			notify  => Service['apache'],
		}

		file { "/var/www/${title}/":
			ensure	=> 'directory',
			mode	=> '0755',
		}

		file { "/var/www/${title}/index.html":
			ensure	=> 'present',
			mode	=> '0644',
			content	=> "This is a virtualhost ${title}\n"
		}
	}

}

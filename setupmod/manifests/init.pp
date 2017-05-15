class setupmod {

## Programs to install

	$user = 'sami'
	$setup = ['apache2', 'mysql-server', 'mysql-client', 'npm', 'nodejs' ]

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
	
}


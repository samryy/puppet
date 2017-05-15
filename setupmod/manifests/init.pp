class setupmod {

## Programs to install

	$setup = ['apache2', 'mysql-server', 'mysql-client', 'npm', 'nodejs' ]

## Create all directories 

	file { '/home/sami/public_html':
		ensure => 'directory',
		group  => '1000',
		mode   => '775',
		owner  => '1000',

	}

	file { '/home/sami/programming':
		ensure => 'directory',
		group  => '1000',
		mode   => '775',
		owner  => '1000',

	}

	file { '/home/sami/git':
		ensure => 'directory',
		group  => '1000',
		mode   => '775',
		owner  => '1000',

	}

	package { $setup:
		ensure => 'installed', 
                allowcdrom => 'true',


	}

	 file {'/var/www/html/index.html': 
                content => "kek",
                require => Package["apache2"];
        }
	
	service { apache2:
		ensure => 'running',
		enable => 'true',
		subscribe => File ['/var/www/html/index.html'],
	} 
	
}


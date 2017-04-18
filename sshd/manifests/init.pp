class sshd {

        package { 'openssh-server':
                ensure  => 'latest',
                allow_virtual   => 'true',
        }

	file {'/etc/ssh/sshd_config':
		content => template('sshd/sshd_config.erb'),
		require => Package ['openssh-server'],
	}
	service {'openssh-server':
		ensure => 'running',
		enable => 'true',
		require => Package['openssh-server'],
	}

}

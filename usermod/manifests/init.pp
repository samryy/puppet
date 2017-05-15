class usermod {

$userlist = [ 'JaakkoK', 'JesseL', 'NiinaK' ]

	user { $userlist:
		ensure	 => 'present',
		managehome => 'true',
		password_max_age => '99999',
		password_min_age => '0',
		groups => 'sudo',
		password => generate('/bin/sh', '-c', "mkpasswd -m sha-512 ${password} | tr -d '\n'"),

	}

	

}


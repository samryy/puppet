class apachemod {
        package {apache2:
                ensure => 'installed', 
                allowcdrom => 'true',
        }
  
        file {'/var/www/html/index.html': 
                 content => "Sami's testsite\n",
                 require => Package["apache2"];
        }

         service {apache2:
                ensure => 'running', 
                enable => 'true', 
                subscribe => File ['/var/www/html/index.html'],
        }
}


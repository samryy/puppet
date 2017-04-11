Second week homework assignments
======

## Prerequisites

Assignment was done on a installed Ubuntu 16.04. 

I started by unistalling Apache2:

``` sudo apt-get remove apache2* ```

I checked that the unistall was succesfull.

```

This site can’t be reached

localhost refused to connect.
Did you mean http://locallhost.com/?
Search Google for localhost
ERR_CONNECTION_REFUSED

``` 


##  Asenna ja konfiguroi jokin palvelin package-file-service -tyyliin Puppetilla.

I created the reguired folders for the Puppet module in /etc/puppet/modules/

```
sudo mkdir apache
cd apache
sudo mkdir manifests
sudoedit /etc/puppet/modules/apache/manifests/init.pp

```
I created a Puppet module that will install apache2

```
class apache {
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


```

The installation was succesfull 

```
Notice: Compiled catalog for sami in environment production in 0.49 seconds
Notice: /Stage[main]/Apache/Package[apache2]/ensure: ensure changed 'purged' to 'present'
Notice: /Stage[main]/Apache/File[/var/www/html/index.html]/content: content changed '{md5}c17957fe6e13179d2f94edc0aab1f23e' to '{md5}5d2f0e085bebeb9c3be23352505efc84'
Notice: /Stage[main]/Apache/Service[apache2]: Triggered 'refresh' from 1 events
Notice: Finished catalog run in 9.33 seconds
```

I ensured that also the /var/www/html/index.html file was modified

```cat /var/www/html/index.html```

Response was succesfull

```Sami's testsite```

Sources: http://terokarvinen.com/2017/aikataulu-%E2%80%93-linuxin-keskitetty-hallinta-%E2%80%93-
ict4tn011-11-%E2%80%93-loppukevat-2017-p2

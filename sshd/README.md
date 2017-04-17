Third week homework assignments
===============================


## a) SSHD. Konfiguroi SSH uuteen porttiin Puppetilla.

I created a module that installs openssh-server. 

```
class sshd {

        package { 'openssh-server':
                ensure  => 'latest',
                allow_virtual   => 'true',
        }
}


```

Then I googled where I could find default ssh-port location. It is found in /etc/ssh/sshd_config. I copied the file into a puppet template. 

Then I extended the class to change the content of the /etc/ssh/sshd_config file. The default ssh-port in template is set to be 2222.

```

class sshd {

        package { 'openssh-server':
                ensure  => 'latest',
                allow_virtual   => 'true',
        }

	file {'/etc/ssh/sshd_config':
                content => template('sshd/sshd_config.erb'),
                require => Package ['openssh-server'],
        }
}

```

I ran the puppet module 

```
Notice: Compiled catalog for sami.pp.htv.fi in environment production in 0.30 seconds
Notice: /Stage[main]/Sshd/Package[openssh-server]/ensure: created
Notice: /Stage[main]/Sshd/File[/etc/ssh/sshd_config]/content: content changed '{md5}b859fecea16bc1493b65347d34b0c24e' to '{md5}a8d7f168c16ea1b32c5f7d1d309977b1'
Notice: Finished catalog run in 7.50 seconds

```

The installation and changing the default ssh port was succesfull!



## b) Modulit Gittiin. Laita modulisi versionhallintaan niin, että saat ne helposti ajettua uudella Live-USB työpöydällä.

As I already had all the modules in github in their own directories in Puppet-repository, I didn't have to make changes to establish good pathing
for the modules.  

Current tree on github: 

```
├── apachemod
│   ├── manifests
│   │   └── init.pp
│   └── README.md
├── LICENSE
├── README.md
├── sshmod
│   └── README.md
└── updatemod
    ├── manifests
    │   └── init.pp
    └── README.md


```

Now I can run all the modules by cloning the repository to my /etc/puppet/.

``` sudo git clone https://github.com/sryyppo/puppet.git ```

Then renaming the repository file.

```sudo mv puppet modules```

Now I can run a module of my choosing. 


## c) Etusivu uusiksi. Vaihda Apachen oletusweppisivu (default website) Puppetilla.

I did the Puppet apachemod last week so after cloning puppet repository to my /etc/puppet and renaming the dir to modules, I could run the apachemod
to change apache default page with my own content.

Original content

``` This is the default welcome page used to test the correct operation of the Apache2... ```

Then I ran the module

``` sudo puppet apply -e 'class {"apachemod":}' ```

The module: 

```

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

```

``` Notice: Compiled catalog for sami.pp.htv.fi in environment production in 0.47 seconds
Notice: /Stage[main]/Apachemod/File[/var/www/html/index.html]/content: content changed '{md5}9ad421244b28db9cb4a6857edd297ef5' to
'{md5}5d2f0e085bebeb9c3be23352505efc84'
Notice: /Stage[main]/Apachemod/Service[apache2]/ensure: ensure changed 'stopped' to 'running'
Notice: Finished catalog run in 0.30 seconds

```

Changing the default content of the apache webpage was successful!

Sources:

- Karvinen, Tero: 17th of April (http://terokarvinen.com/2017/aikataulu-%E2%80%93-linuxin-keskitetty-hallinta-%E2%80%93-ict4tn011-11-%E2%80%93-loppukevat-2017-p2)
- Karvinen, Tero: http://terokarvinen.com/2013/ssh-server-puppet-module-for-ubuntu-12-04


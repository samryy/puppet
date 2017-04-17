Third week homework assignments
===============================


## a) SSHD. Konfiguroi SSH uuteen porttiin Puppetilla.

## b) Modulit Gittiin. Laita modulisi versionhallintaan niin, että saat ne helposti ajettua uudella Live-USB työpöydällä.

In the older version I had all my modules in /puppet/modulename which had to be updated to be more useful.

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

## c) Etusivu uusiksi. Vaihda Apachen oletusweppisivu (default website) Puppetilla.

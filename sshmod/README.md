Third week homework assignments
===============================


## a) SSHD. Konfiguroi SSH uuteen porttiin Puppetilla.

## b) Modulit Gittiin. Laita modulisi versionhallintaan niin, että saat ne helposti ajettua uudella Live-USB työpöydällä.

In the older version I had all my modules in /puppet/modulename which had to be updated to be more useful.

I created a new dir 'modules'.

```mkdir modules```

I moved all the modules into new modules folder. 

```mv updatemod/ sshmod/ apachemod/ /home/sami/git/puppet/modules/```

Now I can copy the current puppet tree from github to /etc/puppet/ and run all the puppet modules easily. 

Current tree on github: 

```

├── LICENSE
├── modules
│   ├── apachemod
│   │   ├── manifests
│   │   │   └── init.pp
│   │   └── README.md
│   ├── sshmod
│   │   └── README.md
│   └── updatemod
│       ├── manifests
│       │   └── init.pp
│       └── README.md
└── README.md

```

## c) Etusivu uusiksi. Vaihda Apachen oletusweppisivu (default website) Puppetilla.

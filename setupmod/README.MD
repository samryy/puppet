Puppet module for single machine configuration
==========

## Prerequisites

- Ubuntu 16.04.2 LTS (Xenial Xerus)
- Git
- Puppet

## Editing

Set packages you want to install $setup
Set user you want to configure $user

## Running the module

Git clone files to /etc/puppet/

Rename 'puppet' => 'modules'

```sudo puppet apply -e 'class {"setupmod":}```

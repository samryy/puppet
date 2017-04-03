# First week homework Assignments


## Prerequisites

I started by this weeks homework assignements by creating a new repository called "Puppet". In this repository I will have two folders,one for notes (e.g. homeworks and other necessary notes) and an other
folder puppet modules. 
The puppet repository was then cloned onto my own computer using command:

```git clone https://github.com/sryyppo/puppet.git```.

I then created 2 new directories; "notes" and modules".

I installed puppet for my computer:
```sudo apt-get update install -y puppet```


## a) Kaksi resurssia. Tee ja testaa moduli, joka käyttää ainakin kahta eri resurssia (esim. file ja package).

I started the assignment by creating a new module with manifests directory:

```sudo mkdir -p /etc/puppet/modules/updatemodule/manifests```.

And then by starting the init.pp for module:

```sudo nano /etc/puppet/modules/updatemodule/manifests/init.pp```

I created a module that installs a package "mariadb-client-10.0".

Notice: Compiled catalog for sami.pp.htv.fi in environment production in 0.23 seconds
Notice: /Stage[main]/Updatemodule/Package[mariadb-client-10.0]/ensure: ensure changed 'purged' to 'present'
Notice: Finished catalog run in 22.49 seconds.`

## b) Messut. Kirjoita lyhyt analyyttinen ja vertaileva arvio jostain tuotteesta, esityksestä tai yrityksestä IT PRO -messuilla. (Vaihtoehtoinen tehtävä, jos et pääse messuille: katso video samasta
aiheesta Puppetista ja toisesta vastaavasta järjestelmästä (esim. Salt) ja kirjoita niistä analyyttinen ja vertaileva kirjoitus.

The video I viewed compares Puppet, saltStack, Ansible and Chef in scalability, ease of setup, availability, management and interoperability. Ansible was clearly the best system overall.
It seems Puppet and chef were lacking a bit in the terms of management and handling. Only Ansible is easy to install as the programs doesn't require special setup.
Though based on a video it's hard to say which system I'd personally prefer. I will do some testing and update the results here later. 

Sources:
- Karvinen, Tero: 28th of March (http://terokarvinen.com/2017/aikataulu-%E2%80%93-palvelinten-hallinta-ict4tn022-2-%E2%80%93-5-op-uusi-ops-loppukevat-2017-p2)
- Karvinen, Tero: http://terokarvinen.com/2013/hello-puppet-revisited-%E2%80%93-on-ubuntu-12-04-lts
- Chef vs Puppet vs Ansible vs SaltStack | Configuration Management Tools Comparison, Edureka: https://www.youtube.com/watch?v=OmRxKQHtDbY




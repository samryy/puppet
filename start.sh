setxkbmap fi
sudo apt-get update
sudo apt-get -y install puppet git
git clone https://github.com/sryyppo/puppet
cd puppet
sudo puppet apply --modulepath puppet/modules/ -e 'class {"apachemod":}'

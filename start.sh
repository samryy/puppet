setxkbmap fi
sudo add-apt-repository universe
sudo apt-get update
sudo apt-get -y install puppet git
cd
git clone https://github.com/sryyppo/puppet
sudo rm -rf /etc/puppet/modules
sudo mv puppet modules
sudo mv puppet /etc/puppet/
sudo puppet apply --modulepath puppet/modules/ -e 'class {"setupmod":}'

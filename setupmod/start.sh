setxkbmap fi
sudo add-apt-repository universe
sudo apt-get update
sudo apt-get -y install puppet git
cd /etc/puppet/
sudo rm -rf /etc/puppet/modules/
sudo git clone https://github.com/sryyppo/puppet
sudo mv puppet modules
cd /modules/setupmod/manifests/
sudo puppet apply -e 'class {"setupmod":}'


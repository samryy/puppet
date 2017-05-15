setxkbmap fi
sudo add-apt-repository universe
sudo apt-get update
sudo apt-get -y install puppet git
cd /etc/puppet/
git clone https://github.com/sryyppo/puppet
sudo mv /home/puppet modules
sudo puppet apply --modulepath puppet/modules/ -e 'class {"setupmod":}'


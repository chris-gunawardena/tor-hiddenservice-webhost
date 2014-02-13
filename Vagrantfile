# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.provider :virtualbox do |vb, override|
    override.vm.box = "precise64"
    override.vm.box_url = "http://files.vagrantup.com/precise64.box"
    config.vm.network "public_network", :bridge => 'en0: Wi-Fi (AirPort)'
    #override.vm.network "private_network", ip: "192.168.231.10"
    #vb.customize ["modifyvm", :id, "--memory", "2048"]
  end


  $script = '

    echo "deb     http://deb.torproject.org/torproject.org precise  main" | sudo tee -a  /etc/apt/sources.list
    gpg --keyserver keys.gnupg.net --recv 886DDD89
    gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | sudo apt-key add -
    sudo apt-get update
    sudo apt-get install deb.torproject.org-keyring
    apt-get install tor -y

    sudo apt-get install apache2 -y
    
    echo "HiddenServiceDir /var/lib/tor/hidden_service/"  | sudo tee -a /usr/share/tor/tor-service-defaults-torrc
    echo "HiddenServicePort 80 127.0.0.1:80"              | sudo tee -a /usr/share/tor/tor-service-defaults-torrc
    sudo /etc/init.d/tor restart

    echo "Tor host name will be in: /var/lib/tor/hidden_service/hostname"

  '
  config.vm.provision "shell", inline: $script
end

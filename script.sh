
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

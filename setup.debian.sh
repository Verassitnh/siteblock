# Install dnsmasq
echo "#### INSTALLING DSNMASQ ####"
sudo apt install dnsmasq

# Write config files
echo "#### WRITING CONFIG FILES ####"
sudo echo "nameserver 127.0.0.1" > /etc/resolv.conf
sudo echo "nameserver 1.1.1.1" > /etc/resolv.dnsmasq

# Set up siteblock
sudo mkdir /etc/siteblock

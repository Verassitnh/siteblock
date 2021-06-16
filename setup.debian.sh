# Install dnsmasq
su root

echo "#### INSTALLING DSNMASQ ####"
apt install dnsmasq
apt install nodejs

# Write config files
echo "#### WRITING CONFIG FILES ####"
echo "nameserver 127.0.0.1" > /etc/resolv.conf
echo "nameserver 1.1.1.1" > /etc/resolv.dnsmasq

# Set up siteblock
cd /etc
git clone https://git.io/Jnn08

# Create a systemd service file

echo "[Unit]
Description=Sitebock

[Service]
ExecStart=${which node} /etc/siteblock/engine/app.js

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/siteblock.service

# Enable and start the service
systemctl enable siteblock.service
systemctl start siteblock.service

# Write the dnsmask config file

echo "addn-hosts=/etc/hosts.blacklist
domain-needed
bogus-priv
cache-size=1000
resolv-file=/etc/resolv.dnsmasq" > /etc/dnsmasq.conf

systemctl enable dnsmasq
systemctl start dnsmasq
systemctl restart NetworkManager
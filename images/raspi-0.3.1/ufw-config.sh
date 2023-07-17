sudo ufw default allow outgoing
sudo ufw default deny incoming

sudo ufw allow 2264/tcp
sudo ufw enable
# Garantindo as chaves
#  ssh-keygen -q -t rsa -f key -N ''

KEY_PATH='/vagrant/files'
mkdir -p /root/.ssh
cp $KEY_PATH/key /root/.ssh/id_rsa
cp $KEY_PATH/key.pub /root/.ssh/id_rsa.pub
cp $KEY_PATH/key.pub /root/.ssh/authorized_keys
chmod 400 /root/.ssh/id_rsa*
cat /root/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys

# Garantindo os hosts
HOSTS=$(head -n7 /etc/hosts)
echo -e "$HOSTS" > /etc/hosts
echo '192.168.0.100 master.labnetcom.example' >> /etc/hosts
echo '192.168.0.110 node01.labnetcom.example' >> /etc/hosts
echo '192.168.0.120 node02.labnetcom.example'>> /etc/hosts
echo '192.168.0.200 node03.labnetcom.example' >> /etc/hosts
echo '192.168.0.250 gitlab.labnetcom.example' >> /etc/hosts


curl -fsSL https://get.docker.com | bash
systemctl start docker
systemctl enable docker
usermod -aG docker vagrant
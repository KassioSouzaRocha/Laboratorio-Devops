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
echo '192.168.0.250 gitlab.labnetcom.example' >> /etc/hosts


# Instalando pre requisitos GITLAB CE.
sudo apt-get update && apt-get upgrade && apt-get dist-upgrade && apt-get autoremove && apt-get autoclean && apt-get cleansudo 
sudo apt-get install -y curl openssh-server ca-certificates tzdata perl libstdc++-9-dev
curl -s https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash

sudo EXTERNAL_URL="http://192.168.0.250" sudo apt-get install gitlab-ce
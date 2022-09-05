# Instalando pre requisitos GITLAB CE.

sudo apt-get update && apt-get upgrade && apt-get dist-upgrade && apt-get autoremove && apt-get autoclean && apt-get cleansudo 
sudo apt-get install -y curl openssh-server ca-certificates tzdata perl


 
# sudo apt-get install -y postfix
sudo apt install libstdc++-9-dev
curl -s https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash

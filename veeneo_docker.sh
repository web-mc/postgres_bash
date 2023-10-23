echo 'Docker install started.'
# Стандартная установка докера
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin


# Установка режима rootless
sudo systemctl disable --now docker.service docker.socket
/usr/bin/dockerd-rootless-setuptool.sh install
# sudo curl -fsSL https://get.docker.com/rootless | sh
sudo echo "export PATH=/home/$(id -u -n)/bin:$PATH" >> ~/.bashrc
sudo echo "export DOCKER_HOST=unix:///run/user/$(id -u)/docker.sock" >> ~/.bashrc
sudo loginctl enable-linger $(id -u -n)
systemctl --user start docker.service
exit

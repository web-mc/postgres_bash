echo 'Docker install started.'
sudo curl -fsSL https://get.docker.com/rootless | sh
sudo loginctl enable-linger $username
sudo echo "export PATH=/home/${username}/bin:$PATH" >> ~/.bashrc
sudo echo "export DOCKER_HOST=unix:///run/user/$(id -u)/docker.sock" >> ~/.bashrc
exit

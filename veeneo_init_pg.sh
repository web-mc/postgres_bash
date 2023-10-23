#!/bin/bash
sudo apt update
sudo apt-get install -y dbus-user-session iptables uidmap sshpass


# Данные для PostgreSQL
db_name=""
db_user=""
db_pass=""
db_port=""
# Данные для PostgreSQL КОНЕЦ


# Добавляем юзера
if [ $(id -u) -eq 0 ]; then
	read -p "Enter username : " username
	read -s -p "Enter password : " password
	egrep "^$username" /etc/passwd >/dev/null
	if [ $? -eq 0 ]; then
		echo "User $username already exists!"
		exit 1
	else
		pass=$(perl -e 'print crypt($ARGV[0], "password")' $password)
		useradd -m -p "$pass" "$username"
        sudo gpasswd -a $username sudo
        echo "$username ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
		[ $? -eq 0 ] && echo "User has been added to system!" || echo "Failed to add a user!"
	fi
else
	echo "Only root may add a user to the system."
	exit 2
fi
# Добавляем юзера конец


# Установка докера
DIR="$(dirname "$(realpath "$0")")"
chmod +rx $DIR/veeneo_docker.sh
ssh-keyscan localhost >> ~/.ssh/known_hosts
sshpass -p $password ssh $username@localhost bash $DIR/veeneo_docker.sh

# Запуск контейнера с постгрес
runuser -l  $username -c "docker run --name veeneo-postgres \
-p $db_port:5432 \
--restart unless-stopped \
-e POSTGRES_DB=$db_name \
-e POSTGRES_USER=$db_user \
-e POSTGRES_PASSWORD=$db_pass \
-d postgres:15"


echo "**=====================================**"
echo "  PostgreSQL is successfully installed!"
echo "  Already running on port $db_port."
echo "**=====================================**"

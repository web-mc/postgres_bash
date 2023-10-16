#!/bin/bash

# Данные для PostgreSQL
while getopts n:u:s:p: flag
do
    case "${flag}" in
        n) db_name=${OPTARG};;
        u) db_user=${OPTARG};;
        s) db_pass=${OPTARG};;
        p) db_port=${OPTARG};;
    esac
done

msg="Your command should be looks like:\nbash init.sh -n db_name -u db_user -s db_pass -p db_port\n"
if [ -z $db_name ]; then
    echo 'Eror: -n (db_name) are not defined.'
    echo -e "$msg"
    exit 1
elif [ -z $db_user ]; then
    echo 'Eror: -u (db_user) are not defined.'
    echo -e "$msg"
    exit 1
elif [ -z $db_pass ]; then
    echo 'Eror: -s (db_pass) are not defined.'
    echo -e "$msg"
    exit 1
elif [ -z $db_port ]; then
    echo 'Eror: -p (db_port) are not defined.'
    echo -e "$msg"
    exit 1
fi
# Данные для PostgreSQL КОНЕЦ


echo "$db_name $db_user $db_pass $db_port"


# Добавляем юзера
# if [ $(id -u) -eq 0 ]; then
# 	read -p "Enter username : " username
# 	read -s -p "Enter password : " password
# 	egrep "^$username" /etc/passwd >/dev/null
# 	if [ $? -eq 0 ]; then
# 		echo "User $username already exists!"
# 		exit 1
# 	else
# 		pass=$(perl -e 'print crypt($ARGV[0], "password")' $password)
# 		useradd -m -p "$pass" "$username"
# 		[ $? -eq 0 ] && echo "User has been added to system!" || echo "Failed to add a user!"
# 	fi
# else
# 	echo "Only root may add a user to the system."
# 	exit 2
# fi
# # Добавляем юзера конец
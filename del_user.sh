passwd --lock test
pkill -9 -u test
deluser --remove-home --remove-all-files test
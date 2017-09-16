#!/usr/bin/env bash
func_check_file_exists () {
	if [ ! -f $1 ]; then
		echo "$1 doesn't exist"
	fi
}

func_check_file_exists "$MONGO_HOME/bin/mongod" 
func_check_file_exists "/etc/mongodb/mongodb.conf" 
func_check_file_exists "/var/log/mongodb/mongod.log" 	
mongod --fork -f /etc/mongodb/mongodb.conf --logpath /var/log/mongodb/mongod.log
tailf /var/log/mongodb/mongod.log
	
#!/bin/bash

if [ ! -z "$@" ]
then
    IFS=':' read -ra config <<< "$@"
    username="${config[0]}"
    uid="${config[1]}"
    gid="${config[2]}"
    group_args=''
    if [ ! -z "$gid" ]
    then
        group_args="$group_args -g $gid"
    fi
    addgroup $group_args $username
    groupname=$(grep '.*:.*:100:.*' /etc/group | awk -v FS=: '{ print $1 }')
    user_args="-s /bin/bash -D -G $groupname"
    if [ ! -z "$uid" ]
    then
        user_args="$user_args -u $uid"
    fi
    adduser $user_args $username
    passwd -u $username
    addgroup sudo
    addgroup $username sudo
fi

# Generate host keys, if they do not exist.
ssh-keygen -A

# Start sshd and run it in the foreground.
# Forward debug logs to stderr
/usr/sbin/sshd -De


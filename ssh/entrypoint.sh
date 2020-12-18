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
        group_args="$group_args --gid $gid"
    fi
    groupname=$username
    groupadd $group_args $groupname
    if [ $? -ne 0 ]
    then
        groupname=$(grep ".*:.*:$gid:.*" /etc/group | awk -v FS=: '{ print $1 }')
    fi
    user_args="--shell /bin/bash --gid $gid --no-create-home"
    if [ ! -z "$uid" ]
    then
        user_args="$user_args --uid $uid"
    fi
    useradd $user_args $username
    passwd --delete $username
    groupadd sudo
    usermod -aG sudo $username
fi

# Generate host keys, if they do not exist.
ssh-keygen -A

# Start sshd and run it in the foreground.
# Forward debug logs to stderr
/usr/sbin/sshd -De

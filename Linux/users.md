# Users


```
whoami

hostname
hostnamectl
hostnamectl status


# Show who is logged on and what are they doing
w
id
id [username]



# List all users
cat /etc/passwd
cut -d: -f1 /etc/passwd | sort | uniq
awk -F: '{print "User:", $1, "UID:", $3, "GID:", $4}' /etc/passwd

getent passwd | cut -d: -f1
getent passwd | awk -F: '{print $1, ":", $6}'

# List Users by Number of Processes
ps -e -o user= | awk '{if ($1 != "") print $1}' | sort | uniq -c | sort -n



# Run command as specific user
sudo -u [username] [command]



# terminate all processes for a specified user
pkill -KILL -u [USERNAME]


# logout using command line
loginctl terminate-user [USERNAME]







# sudo
usermod -aG sudo [USER NAME]
sudo -i
sudo -s
sudo su -; cd -


# switch user
su [USER NAME]
su - [USER NAME]
su -l [USER NAME]








# Delete user
userdel -r [USER NAME]
rm -rf /home/[USER NAME]
rm -rf /var/mail/[USER NAME]




# Create user
useradd -m [USER NAME]
sudo useradd -m -s /bin/bash [USERNAME]


# set password
passwd [USER NAME]

# add extra info
sudo usermod -c "Full Name" [USER NAME]






# Change user name
## 1 
hostnamectl set-hostname [NEW NAME]
# then modify `/etc/hostname`

## 2 - login as root and overwrite oldname
usermod -l [NEW NAME] -d /home/[OLD NAME] -m [OLD NAME]
groupmod -n [NEW NAME] [OLD NAME]

```


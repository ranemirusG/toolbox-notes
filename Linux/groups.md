# Groups

- GECOS Field
1 - User's full name (or application name, if the account is for a program)
2 - Building and room number or contact person
3 - Office telephone number
4 - Home telephone number
5 - Any other contact information (pager number, fax, external e-mail address, etc.)



```

# list all the groups
getent group
cat /etc/group



# Check groups a user is in
groups [USERNAME]

# Add user to group. Example: If you want to add yourself to the docker group to use docker without sudo
sudo usermod -aG docker [USERNAME]

# Add a user to the wheel group, which grants them sudo privileges
usermod -aG wheel [USERNAME]

# Delete user from group
sudo gpasswd -d [USERNAME] [GROUP]





# find files belonging to a specified group
find / -group [GROUP NAME] 2>/dev/null


```
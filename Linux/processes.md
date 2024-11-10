# Linux Processes

The Linux kernel manages multitasking through the use of processes. The kernel maintains information about each process to help keep things organized, and each process is assigned a number called a process ID (PID). The Linux shell also introduces the concept of jobs69 to ease the user’s workflow during a terminal session. As an example, cat error.txt | wc -m is a pipeline of two processes, which the shell considers a single job. 

jobs
bg
fg


%Number : Refers to a job number such as %1 or %2 
%String : Refers to the beginning of the suspended command’s name such as 
%commandNameHere or %ping 
%+ OR %% : Refers to the current job 
%- : Refers to the previous job 




## monitor files and commands in real-time

```
sudo tail -f /var/log/apache2/access.log
watch -n 5 w list logged-in users (via the w command) once every 5 seconds
watch -n 1 "ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 10
```



## Cron Jobs
In Linux, there are multiple folders that can contain these cronjobs: cron.d, cron.daily, cron.hourly, cron.monthly, crontab, cron.weekly.

- <https://crontab.guru/>

`cron`
`crontab`
`man 5 crontab`

```
# Find cron jobs
ps -aux | grep cron


```



## kill [PROCESS ID]

Default signal for kill is SIGTERM (request termination)
- <https://en.wikipedia.org/wiki/Signal_(IPC)#POSIX_signals>









## ps (Process Status)

Unlike the jobs command, ps lists processes system wide, not only for the current terminal session.

- <https://askubuntu.com/questions/484982/what-is-the-difference-between-standard-syntax-and-bsd-syntax>
- <https://www.linfo.org/ps.html>




```
# "a" and "x" flags to list all processes with or without a tty and the "u" flag to list the processes in a user-readable format
ps aux

# run the ps command every second via the watch utility and grep the results on any occurrence of the word "pass"
watch -n 1 "ps -aux | grep pass"



# select all process (-e) with full format (-f)
ps -ef

# select by command name (-C)
ps -fC [COMMAND]

# current shell process, including the name of the shell
ps -p $$

# what terminal am I using?
ps -o ppid= -p $$ | xargs ps -o comm=



ps --pid=1
ps --pid=1 f
ps --pid=1 -f


```









## systemd / systemctl



Power management
```
sudo systemctl poweroff
sudo systemctl reboot
sudo systemctl suspend
sudo systemctl hibernate
```

Services
```
# Enable a service to start at boot
sudo systemctl enable <service-name>

# Start a service
sudo systemctl start <service-name>

# Stop a service
sudo systemctl stop <service-name>

# Restart a service
sudo systemctl restart <service-name>

# Reload service configuration
sudo systemctl reload <service-name>



```


```
# System status
systemctl status


systemctl list-timers --all

# List services
systemctl list-units --type=service
systemctl list-unit-files --type=service --state=running
systemctl list-unit-files --type=service --state=enabled

# List failed services
systemctl --failed

journalctl -xe -u [SERVICE NAME].service



```













`sudo systemctl start ssh`

verify that the SSH service is running and listening on TCP port 22
`sudo ss -antlp | grep sshd` 

If we want to have the SSH service start automatically at boot time (as many users prefer), we 
simply enable it using the systemctl command. However, be sure to change the default 
password first!

`sudo systemctl enable ssh`

We can use systemctl to enable and disable most services within Kali Linux.


see a table of all available services
`systemctl list-unit-files`





- <https://linuxhandbook.com/create-systemd-services/>
- <https://www.freedesktop.org/software/systemd/man/latest/systemd.service.html>
- <https://www.freedesktop.org/software/systemd/man/latest/systemd.unit.html#Specifiers> (to user environment variables in services, example `%u` goes instead of `$HOME`)

1. Example script to create a service:
```
!/bin/bash

# Define service file path
SERVICE_FILE="/etc/systemd/system/delete_temp_vars.service"

# Create the service file
sudo bash -c "cat > $SERVICE_FILE << 'EOF'
[Unit]
Description=Delete Temporary Variables at Boot
After=network.target

[Service]
Type=simple
ExecStart=/home/kali/.local/bin/delete_temp_vars.sh
User=kali

[Install]
WantedBy=default.target
EOF"

# Set the correct permissions for the service file
sudo chmod 644 $SERVICE_FILE

# Reload systemd to recognize the new service
sudo systemctl daemon-reload

# Enable the service to start at boot
sudo systemctl enable delete_temp_vars.service

# Start the service immediately
sudo systemctl start delete_temp_vars.service

# Check the status of the service
sudo systemctl status delete_temp_vars.service
```



2. Example script to delete a service:
```
#!/bin/bash

SERVICE_NAME=$1

# Stop the service
sudo systemctl stop $SERVICE_NAME

# Disable the service
sudo systemctl disable $SERVICE_NAME

# Remove the service file
sudo rm /etc/systemd/system/$SERVICE_NAME

# Reload systemd to apply changes
sudo systemctl daemon-reload

# Inform the user
echo "Service $SERVICE_NAME stopped, disabled, and deleted."
```






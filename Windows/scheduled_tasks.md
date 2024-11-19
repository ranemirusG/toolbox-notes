# Scheduled Tasks

- <https://en.m.wikipedia.org/wiki/List_of_job_scheduler_software>





```

schtasks.exe
schtasks /query /fo LIST /v



```





## Find deleted tasks
Event View > Applications and Services Logs > Microsoft > Windows > TaskScheduler Operational.evtx

C:\Windows\System32\winevt\Logs\Microsoft-Windows-TaskScheduler%4Operational.evtx

- Event ID 4698: A scheduled task was created
- Event ID 4702: A scheduled task was updated









## autoruns.exe (Sysinternals)
With the autoruns tool, we can identify commonly used permanence methods that attackers used like Registry, Startup, and Schedule Task. We run it as an intermediary admin and go to the "Scheduled Task" tab.

When necessary, we can examine each one individually and identify the suspicious one. However, let's think of what we can do if we have a high number of scheduled tasks, and we are racing against time. In order to conduct an initial elimination, we can start with scheduled tasks that do not have a "Publisher". The fact that there is a publisher does not make it completely trustworthy, however, it is a higher probability that suspicious tasks do not have publishers.









## `AT` command (DEPRECATED)
- <https://en.m.wikipedia.org/wiki/At_(command)>
#!/bin/bash

now=$(printf '%(%H:%M:%S)T\n')

IFS=. read seconds x <<< /proc/uptime

weeks=$(( seconds / 3600 / 24 / 7 ))
days=$(( seconds / 3600 / 24 % 7 ))
hours=$(( seconds / 3600 % 24 ))
minutes=$(( (seconds % 3600) / 60 ))

# Usuários executando processos...
[[ -f /var/run/utmp ]] && utmp=/var/run/utmp || utmp=/run/utmp
users=$(utmpdump $utmp 2> /dev/null | grep -c '^\[7\]')

# Médias de carga da CPU...
read a b c x < /proc/loadavg
load="$a, $b, $c"

# Saída...
printf 'Uptime : %s up ' $now
(( weeks )) && printf '%s weeks, ' $weeks
(( days )) && printf '%s days, ' $days
printf '%d:%02d, ' $hours $minutes
printf ' %s users, ' $users
printf ' load average: %s\n' "$load"

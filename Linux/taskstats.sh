#!/bin/bash

awk '
    BEGIN {r=s=i=z=t=c=0}
    /R/  {r++; next}
    /I/  {i++; next}
    /Z/  {z++; next}
    /tT/ {t++; next}
    {s++}
    END {
	print "Tasks  : "(r+s+i+z+t)" total, "r" running, "s" sleeping, "i" idle, "t" stopped, "z" zombie"
    }
' <(sed -En 's/State:[[:blank:]]+(.).*/\1/p' /proc/[1-9][0-9]*/status)


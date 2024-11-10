#!/bin/bash

awk '
    /MemTotal/	   {mt  = ($2/1024)}
    /MemFree/  	   {mf  = ($2/1024)}
    /MemAvailable/ {ma  = ($2/1024)}
    /^Buffers/     {b   = ($2/1024)}
    /^Cached/      {c   = ($2/1024)}
    /SwapCached/   {swc = ($2/1024)}
    /SwapTotal/    {swt = ($2/1024)}
    /SwapFree/	   {swf = ($2/1024)}
    /SReclaimable/ {sr  = ($2/1024)}
    END {
        bc  = b + c + sr
    	mu  = mt - (mf + bc)
	swu = swt - swf
	printf "MB mem :\t%.1f total\t%.1f free\t%.1f used\t%.1f buff/cache\t%.1f avail.\n", mt, mf, mu, bc, ma
	printf "MB swap:\t%.1f total\t%.1f free\t%.1f used\t\n", swt, swf, swu
	 
    }
' /proc/meminfo | column -ts $'\t' --table-right 2,3,4,5,6

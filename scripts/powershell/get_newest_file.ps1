# Get newest file in current dir
(gci . | sort LastWriteTime | select -last 1).name
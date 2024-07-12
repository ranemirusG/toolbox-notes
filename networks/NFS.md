# NFS (Network File System)

- <https://en.wikipedia.org/wiki/Network_File_System>

- <https://medium.com/@jasserguessmiloga/tryhackme-network-services-2-walkthrough-3631fdc14eb9>

Example:
`/usr/sbin/showmount -e TARGET` to list the NFS shares

Mount the share to our local machine:
`sudo mount -t nfs IP:share_dir /tmp/mount/ -nolock`
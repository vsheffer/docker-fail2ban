A fail2ban Docker container that is meant to be used to block IPs in a cluster of Nginx servers 
running AWS.

It updates the deny-hosts file in an S3 bucket from which servers in the cluster can read copy
and reload config in Nginx.

To build you will first need to make an aws directory, and add your aws credentials file to it.
I use aws configure to create that file and then copy it to the location.

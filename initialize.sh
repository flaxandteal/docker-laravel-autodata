#!/bin/sh

rm -rf /data/www
rm -rf /data/logs
mkdir -p /data/www
mkdir -p /data/logs
chown www-data /data/logs
cd /data
mkdir -p paypal
mkdir -p secrets
chgrp www-data paypal
chgrp www-data secrets
chmod g+rwX paypal
chmod o-rwX paypal
chmod g+rX secrets
chmod o-rwX secrets
umask 022
aws s3 sync s3://sts-live/ www/
aws s3 sync s3://sts-credentials/ credentials/
mv credentials/server.* secrets
cd www
tar -xzpf current.tgz
rm current.tgz
mv ../credentials/.env.php .

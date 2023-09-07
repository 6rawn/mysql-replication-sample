#!/bin/bash -eu

mysql -u root -pmysql < /scripts/init.sql
mysqldump -u root -pmysql --all-databases --flush-logs --single-transaction --master-data=2 > /tmp/master.db

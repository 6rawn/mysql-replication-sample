#!/bin/bash -eu

mysql -u root -pmysql < /tmp/master.db

# -- CHANGE MASTER TO MASTER_LOG_FILE='1a0615a6af7f-bin.000004', MASTER_LOG_POS=157;
# -> 1a0615a6af7f-bin.000004
# -> 157
MASTER_LOG_FILE=$(grep "CHANGE MASTER TO MASTER_LOG_FILE" /tmp/master.db | sed -e "s#^--.*='##g" -e "s#',.*##g")
MASTER_LOG_POS=$(grep "CHANGE MASTER TO MASTER_LOG_FILE" /tmp/master.db | sed -e "s#^--.*=##g" -e "s#;.*##g")

mysql -uroot -pmysql -e "CHANGE MASTER TO MASTER_HOST='node-1', MASTER_PORT=3306, MASTER_SSL=0, MASTER_USER='repl', MASTER_PASSWORD='repl9999', MASTER_LOG_FILE='${MASTER_LOG_FILE}', MASTER_LOG_POS=${MASTER_LOG_POS};"
mysql -uroot -pmysql -e "START REPLICA;"
mysql -uroot -pmysql -e "SET GLOBAL SUPER_READ_ONLY=ON;"
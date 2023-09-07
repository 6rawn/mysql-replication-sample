#!/bin/bash -eu

docker compose exec -it node-1 /scripts/backup.sh
docker compose cp node-1:/tmp/master.db . 
docker compose cp master.db node-2:/tmp/master.db 
docker compose cp master.db node-3:/tmp/master.db  
docker compose exec -it node-2 /scripts/restore.sh
docker compose exec -it node-3 /scripts/restore.sh

# docker compose exec -it node-1 bash
# docker compose exec -it node-2 bash
# docker compose exec -it node-3 bash
# mysql -uroot -pmysql;
# show slave status\G;

# show variables like 'default_authentication_plugin';
#select user, host, plugin from mysql.user where user = 'repl';


# SET GLOBAL READ_ONLY=ON;
# SET GLOBAL SUPER_READ_ONLY=ON;

# SELECT @@global.read_only;
# SELECT @@global.super_read_only;

# SHOW SLAVE STATUS\G
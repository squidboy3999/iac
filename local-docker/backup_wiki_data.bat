docker exec -it mediawiki_run sh -c "cd /var/www;tar -czvf mediawiki_data.tar.gz html"
docker cp mediawiki_run:/var/www/mediawiki_data.tar.gz mediawiki_data.tar.gz
docker exec -it mariadb_run sh -c "cd /var/lib; tar -czvf mediawiki_mdb_data.tar.gz mysql"
docker cp mariadb_run:/var/lib/mediawiki_mdb_data.tar.gz mediawiki_mdb_data.tar.gz
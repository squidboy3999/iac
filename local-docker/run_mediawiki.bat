docker stop mediawiki_run
docker stop mariadb_run
docker rm mediawiki_run
docker rm mariadb_run
docker build -t mediawiki-img -f ./Dockerfile-mediawiki .
docker build -t mariadb-img -f ./Dockerfile-mariadb .
docker network rm wiki_net
docker network create wiki_net
docker run -d -v /var/lib/mysql/ --network=wiki_net -e MYSQL_DATABASE=my_wiki -e MYSQL_USER=wikiuser -e MYSQL_PASSWORD=other_password -e MYSQL_ROOT_PASSWORD=root_password --name mariadb_run mariadb-img
timeout 60
docker run -d -v /var/www/html/ --network=wiki_net --name mediawiki_run -p 8080:80 mediawiki-img
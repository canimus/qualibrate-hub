echo "Creating Qualibrate Network"
docker network create qualibrate-net
echo ""

echo "Creating Qualibrate Volumes"
docker volume create qfp-app-fs
docker volume create qfp-db-fs
echo ""

echo "Initialising Database Container"
docker run --name qualibrate-db -p 3306:3306 -v qfp-db-fs:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=root --network qualibrate-net -d hub.qualibrate.org:5000/qualibrate-db:2.3.1
echo ""

echo ">Connecting..."
sleep 5
echo ">Done"

echo "Initialising Application Container"
docker run -d -p 9990:9990 -p 8443:8443 --name qualibrate-app --network qualibrate-net -v qfp-app-fs:/opt/qfp-data -e QUALIBRATE_VERSION="2.3.1" hub.qualibrate.org:5000/qualibrate-app:2.3.1
echo ""

echo "Creating Schemas"
docker exec qualibrate-db bash -c 'mysql -u root -p"root" --execute "CREATE DATABASE IF NOT EXISTS qfp_active;"'
docker exec qualibrate-db bash -c 'mysql -u root -p"root" --execute "CREATE DATABASE IF NOT EXISTS qfp_history;"'
echo ""

echo "Setting up dependencies, libraries and security"
docker exec qualibrate-app bash -c '/opt/jboss/wildfly/bin/jboss-cli.sh  --user="admin" --password="admin" --connect --file=/tmp/setup.cli'
sleep 5
echo ""

docker exec qualibrate-app bash -c '/opt/jboss/wildfly/bin/jboss-cli.sh  --user="admin" --password="admin" --connect --commands="deploy /tmp/QFP-${QUALIBRATE_VERSION}.ear"'
echo ""

echo "Loading Master Data"
docker exec qualibrate-db bash -c 'mysql -u root -p"root" qfp_active < /tmp/init-db.sql'
echo ""


echo "Setting default admin:password credentials"
docker exec qualibrate-db bash -c 'mysql -u root -p"root" qfp_active --execute "update users set password = \"X03MO1qnZdYdgyfeuILPmQ==\" where id = 1"'


echo "Completed"
echo ""

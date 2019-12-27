# sudo apt-get update
# sudo apt install docker.io docker-compose

echo "*********************"
echo "Docker Version"
echo $(docker -v)
echo "*********************"


echo "*********************"
echo "docker-compose Version"
echo $(docker-compose -v)
echo "*********************"


echo "*********************"
echo "Creating .env file and setting variables"
echo "*********************"

sudo touch .env

echo "*********************"
echo "Setting WordPress env variables"
echo "*********************"

WORDPRESS_DB_USER=WORDPRESS_DB_USER=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 20 | head -n 1)
WORDPRESS_DB_PASSWORD=WORDPRESS_DB_PASSWORD=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 20 | head -n 1)
WORDPRESS_DB_NAME=WORDPRESS_DB_NAME=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 20 | head -n 1)
echo $WORDPRESS_DB_USER | sudo tee -a .env
echo $WORDPRESS_DB_PASSWORD | sudo tee -a .env
echo $WORDPRESS_DB_NAME | sudo tee -a .env

echo "*********************"
echo "Setting MySQL env variables"
echo "*********************"

MYSQL_ROOT_PASSWORD=MYSQL_ROOT_PASSWORD=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 20 | head -n 1)
MYSQL_PASSWORD=MYSQL_PASSWORD=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 20 | head -n 1)
MYSQL_DATABASE=MYSQL_DATABASE=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 20 | head -n 1)
MYSQL_USER=MYSQL_USER=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 20 | head -n 1)
echo $MYSQL_ROOT_PASSWORD | sudo tee -a .env
echo $MYSQL_PASSWORD | sudo tee -a .env
echo $MYSQL_DATABASE | sudo tee -a .env
echo $MYSQL_USER | sudo tee -a .env


echo "*********************"
echo "Starting docker containers"
echo "*********************"
docker-compose up
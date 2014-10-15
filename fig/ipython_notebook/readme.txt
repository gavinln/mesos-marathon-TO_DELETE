# build the docker container
sudo docker build -t notebook .

sudo docker run -d -p 8888:8888 notebook

To build the Docker container and run it
sudo fig up -d

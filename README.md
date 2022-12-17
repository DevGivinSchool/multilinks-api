# multilinks-api
API HUB to short your links in easy way


# Docker
docker build . -t devgivinschool/multilinks-api:latest
docker push devgivinschool/multilinks-api:latest
# Run for developer tests
docker run -d --rm --name multilinks-api -p 3000:3000 --user 1007:1007 devgivinschool/multilinks-api:latest
docker stop multilinks-api


# Deploy
sudo useradd -m -s /usr/sbin/nologin multilinks-api
sudo nano /home/dr/multilinks_api_run.sh
sudo chown dr:dr /home/dr/multilinks_api_run.sh
sudo chmod 700 /home/dr/multilinks_api_run.sh
sudo su - dr

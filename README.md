# openai-neural-mmo-docker 
https://github.com/openai/neural-mmo

Docker for Openai's Neural MMO

docker run -d -p 8080:8080 **built-image-name** tail -f /dev/null
  
  **or**
  
docker run -d  --volume="$(pwd)/models:/root/models" --volume="$(pwd)/workspace:/root/workspace" -p 8080:8080 gcullie/openai-neural-mmo:master tail -f /dev/null

docker ps
docker exec -i -t **id** /bin/bash
python Forge.py --render
docker stop **id**

python Forge.py --render
http://localhost:8080/forge/embyr/ in Firefox (Chrome may not work)

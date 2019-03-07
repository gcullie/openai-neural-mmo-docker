# openai-neural-mmo-docker 
https://github.com/openai/neural-mmo

Docker for Openai's Neural MMO

docker run -d -p 8080:8080 **built-image-name** tail -f /dev/null
  
  **or**
  
docker run -d -p 8080:8080 gcullie/openai-neural-mmo:master tail -f /dev/null</br>

docker ps  *(get the id for the runner docker)*</br>
docker exec -i -t **id** /bin/bash</br>
python Forge.py --render</br>
docker stop **id**</br>

python Forge.py --render</br>
http://localhost:8080/forge/embyr/ in Firefox (Chrome may not work)</br>

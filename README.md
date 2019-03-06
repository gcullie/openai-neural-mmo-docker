# openai-neural-mmo-docker https://github.com/openai/neural-mmo
Docker for Openai's Neural MMO
docker run -it  -p 8080:8080 ai-neural-mmo-docker bash

python Forge.py --render
http://localhost:8080/forge/embyr/ in Firefox (Chrome may not work)
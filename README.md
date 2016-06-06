# docker-aem
Dockerfile for Adobe Experience Manager(AEM)

##Build docker image
docker build -t aem .

##Run a container
docker run -i -t -p 4502:4502 -p 5005:5005 --name aem_author aem

##Then run the init.py file first time only to setup and initialize the AEM author instance.
python3 init.py

##exec to the docker container
docker exec -it aem_author bash

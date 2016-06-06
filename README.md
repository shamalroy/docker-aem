# docker-aem
Dockerfile for Adobe Experience Manager(AEM)

##Build docker image
docker build -t aem .

##Run a container and init AEM author instance
docker run -i -t \
-p 4502:4502 \
-p 5005:5005 \
--name aem_author aem \
python3 /var/aem/crx-quickstart/init.py

##exec to the docker container
docker exec -it aem_author bash

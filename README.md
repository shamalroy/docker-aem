# docker-aem
Dockerfile for Adobe Experience Manager(AEM)


##Build docker image
docker build -t aem:61 .

##Run a container
docker run --name aem_author -p 4502:4502 -p 5005:5005 -it aem:61

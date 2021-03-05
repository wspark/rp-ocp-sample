#FROM image-registry.openshift-image-registry.svc:5000/openshift/httpd:2.4.34
FROM docker.io/httpd

#USER root
RUN mkdir -p /logs/web 

COPY files/httpd.conf /usr/local/apache2/conf
COPY files/httpd-vhosts.conf /usr/local/apache2/conf/extra/

# Direcotry Permission
RUN chmod 777 /logs  -R  
 
EXPOSE 8000

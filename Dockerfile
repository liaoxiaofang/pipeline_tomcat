#基础镜像
FROM 192.168.3.207:5000/fft/tomcat:v1.4

RUN mkdir -p /innode/app/config && mkdir -p /innode/docs/upload/license
ADD application.properties /usr/local/tomcat/webapps
ADD application.properties /innode/app/config
ADD innode.crt /innode/docs/upload/license
ADD license.lic /innode/docs/upload/license     

VOLUME ["/usr/local/tomcat/webapps","/innode/app/config","/innode/docs/upload/license"]

EXPOSE 8080

CMD ["/bin/sh", "-e", "/usr/local/bin/run"]
#基础镜像
FROM 192.168.3.198:8083/evada/tomcat:v1.4

RUN mkdir -p /innode/app/config && /innode/docs/upload/license
#ADD inno-de-web.war /usr/local/tomcat/webapps/
ADD application.properties /innode/app/config/
ADD innode.crt /innode/docs/upload/license
ADD license.lic /innode/docs/upload/license     


EXPOSE 8080

CMD ["/bin/sh", "-e", "/usr/local/bin/run"]
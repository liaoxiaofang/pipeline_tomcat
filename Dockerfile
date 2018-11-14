#基础镜像
FROM 192.168.3.207:5000/fft/tomcat:v1.4

RUN mkdir -p /innode/app/config && mkdir -p /innode/docs/upload/license
#ADD inno-de-web.war /usr/local/tomcat/webapps
ADD cp_war.sh /tmp
ADD application.properties /tmp
ADD application.properties /innode/app/config
ADD innode.crt /innode/docs/upload/license
ADD license.lic /innode/docs/upload/license     
RUN chmod +x /tmp/cp_war.sh
RUN echo 'cat /tmp/cp_war.sh'

VOLUME ["/usr/local/tomcat/webapps","/innode/app/config","/innode/docs/upload/license"]

EXPOSE 8080

CMD ["/bin/sh", "-e", "/usr/local/bin/run"]
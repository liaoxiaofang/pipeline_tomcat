#基础镜像
FROM 192.168.3.207:5000/fft/tomcat:v1.4

RUN mkdir -p /innode/app/config && mkdir -p /innode/docs/upload/license
ADD application.properties /innode/app/config
ADD innode.crt /innode/docs/upload/license
ADD license.lic /innode/docs/upload/license 
#ADD inno-de-web.war /tmp   
#ADD cp_war.sh /tmp 
#RUN chmod a+x /tmp/cp_war.sh

VOLUME ["/usr/local/tomcat/webapps","/innode/app/config","/innode/docs/upload/license"]

EXPOSE 8080

#ENTRYPOINT ["/tmp/cp_war.sh"]
CMD ["/bin/sh", "-e", "/usr/local/bin/run"]
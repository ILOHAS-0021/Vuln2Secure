FROM tomcat:9.0.30

ENV CATALINA_HOME=/usr/local/tomcat

WORKDIR $CATALINA_HOME

RUN rm -rf webapps && mv webapps.dist webapps

COPY ./index.jsp webapps/ROOT/index.jsp
COPY ./upload.jsp webapps/ROOT/
COPY ./cos.jar lib/

EXPOSE 8080

CMD ["sh", "bin/catalina.sh", "run"]

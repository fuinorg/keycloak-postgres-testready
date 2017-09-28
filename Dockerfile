FROM jboss/keycloak-postgres:3.3.0.CR1
MAINTAINER Michael Schnell

ENV TEST_IMPORT_JSON "{}"
ENV KEYCLOAK_JSON_IMPORT_FILE_NAME /opt/jboss/keycloak/bin/test-realm.json

USER root

ADD docker-entrypoint.sh /opt/jboss/
RUN ["chown", "jboss:jboss", "/opt/jboss/docker-entrypoint.sh"]
RUN ["chmod", "+x", "/opt/jboss/docker-entrypoint.sh"]

ENTRYPOINT [ "/opt/jboss/docker-entrypoint.sh" ]
CMD ["-b", "0.0.0.0", "-Dkeycloak.import=/opt/jboss/keycloak/bin/test-realm.json"]

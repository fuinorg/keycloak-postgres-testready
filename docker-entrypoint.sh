#!/bin/bash

# Optional user setup
if [ $KEYCLOAK_USER ] && [ $KEYCLOAK_PASSWORD ]; then
    keycloak/bin/add-user-keycloak.sh --user $KEYCLOAK_USER --password $KEYCLOAK_PASSWORD
fi

# Copies the content of the environment variable TEST_SETUP_JSON into a file
echo "$TEST_IMPORT_JSON" > $KEYCLOAK_JSON_IMPORT_FILE_NAME
chown jboss:jboss $KEYCLOAK_JSON_IMPORT_FILE_NAME

exec /opt/jboss/keycloak/bin/standalone.sh $@
exit $?

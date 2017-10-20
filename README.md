# keycloak-postgres-testready
A Keycloak/PostgreSQL docker image that allows adding a test realm with preconfigured users and clients

![Warning](https://raw.githubusercontent.com/fuinorg/keycloak-postgres-testready/master/warning.gif) **No longer maintained** Use [keycloak-testready](https://github.com/fuinorg/keycloak-testready) instead!  ![Warning](https://raw.githubusercontent.com/fuinorg/keycloak-postgres-testready/master/warning.gif)

[![Automated Docker Build](https://img.shields.io/docker/automated/fuinorg/keycloak-postgres-testready.svg)](https://hub.docker.com/r/fuinorg/keycloak-postgres-testready/)

## Base Version

- Keycloak with Postgres 3.3.0.CR1

## Usage

You can pass the JSON import file for your test realm using the environment variable **TEST_IMPORT_JSON**:

    docker run -it -e TEST_IMPORT_JSON="{\"realm\":\"tst\", ... }" <...more parameters...> fuinorg/cloudblue-postgres-testready

Your 'tst' realm is then imported and ready for use in your tests.

For an example of the JSON format see [keycloak-import-example.json](keycloak-import-example.json).

## Docker compose file

For your convenience there is also a [Docker compose file](docker-compose.yml) to start the Postgres database and Keycloak together manually.  

**CAUTION**: You need to create an ".env" file in the same directory where the 'docker-compose.yml' is located.

    postgresPassword=<password>
    postgresRootPassword=<password>
    keycloakUser=admin
    keycloakPassword=<password>

Just run:

    docker-compose up
   
Now you can log into your Keycloak server at http://localhost:8088/ using the above defined credentials.

Shutdown with **CTRL C** and then run:

    docker-compose rm

This removes the stopped service containers.

#!/bin/bash

# create new project 
oc new-project build-templates

# change to the project
oc project build-templates

# create template 
oc create -f ~/home/srini/DO288/labs/build-templates/php-mysql-ephemeral.yml -n openshift

# create new-app from the template php-mysql-example

oc new-app --template php-mysql-example -p NAME=quotesapi \
	-p APPLICATION_DOMAIN=quote.apps.example.com \
	-p SOURCE_REPOSITORY_URL=https://github.com/srinivasareddyv/DO288-apps \
	-p CONTEXT_DIR=quotes \
	-p DATABASE_SERVICE_NAME=quotesdb \
	-p DATABASE_USER=user1 \
	-p DATABASE_PASSWORD=password \
	--name quotes

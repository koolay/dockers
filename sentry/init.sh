#!/bin/bash

DOCKER_HOST_IP=$(netstat -nr | grep '^0\.0\.0\.0' | awk '{print $2}')
echo "$DOCKER_HOST_IP dev.myapp.com" >> /etc/hosts

# check DB health if "SENTRY_DOCKER_DO_DB_CHECK" is set
if [ -n "$SENTRY_DOCKER_DO_DB_CHECK" ]; then
    echo 'check db alive ...'
    python /check_db_alive.py 10 3
    if [ "$?" != "0" ]; then
        echo "couldn't establish DB connection. exiting..."
        exit 1
    fi
fi

sentry --config=$SENTRY_CONF upgrade --noinput

# create superuser
python /create_team_or_project.py admin "${SENTRY_ADMIN_USERNAME:-admin}" "${SENTRY_ADMIN_EMAIL:-root@localhost}" "${SENTRY_ADMIN_PASSWORD:-admin}"

if [ -n "$SENTRY_INITIAL_TEAM" ]; then
    python /create_team_or_project.py team ${SENTRY_ADMIN_USERNAME:-admin} $SENTRY_INITIAL_TEAM
    if [ -n "$SENTRY_INITIAL_PROJECT" ]; then
        python /create_team_or_project.py project $SENTRY_INITIAL_TEAM $SENTRY_INITIAL_PROJECT ${SENTRY_INITIAL_PLATFORM:-python}
        if [ -n "$SENTRY_INITIAL_KEY" ]; then
            python /create_team_or_project.py key $SENTRY_INITIAL_TEAM $SENTRY_INITIAL_PROJECT $SENTRY_INITIAL_KEY
        fi
        if [ -n "$SENTRY_INITIAL_DOMAINS" ]; then
            python /create_team_or_project.py origins $SENTRY_INITIAL_TEAM $SENTRY_INITIAL_PROJECT "$SENTRY_INITIAL_DOMAINS"
        fi
    fi
fi


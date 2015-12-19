#!/usr/bin/env sh
/usr/local/bin/sentry --config=/sentry.conf.py celery worker -B

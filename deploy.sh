#!/usr/bin/env bash

set -e

APP_NAME="pgadmin-web"
HOSTNAME="pgadmin-dev"
DOMAIN="cfapps.us10-001.hana.ondemand.com"
APP_PORT="8080"

echo "Deploying ${APP_NAME}..."
cf push

echo "Unmapping existing route..."
cf unmap-route "${APP_NAME}" "${DOMAIN}" \
  --hostname "${HOSTNAME}" || true

echo "Mapping route to application port ${APP_PORT}..."
cf map-route "${APP_NAME}" "${DOMAIN}" \
  --hostname "${HOSTNAME}" \
  --app-port "${APP_PORT}"

echo "Deployment completed successfully."
echo "PGAdmin URL: https://${HOSTNAME}.${DOMAIN}"
#!/bin/sh

# Import config
. ./conf/slack.conf

if ! /var/www/ssl-proof/rancher/.well-known/certbot-auto renew --force-renew ; then
sleep 15

# Slack Title
TITLE=${TITLE:-"[FAILED] Let's Encrypt SSL"}

# Slack Message
MESSAGE=${MESSAGE:-"SSL has not updated."}

#POST
curl -s -S -X POST --data-urlencode "payload={
        \"channel\": \"${CHANNEL}\",
        \"username\": \"${BOTNAME}\",
        \"attachments\": [{
        \"color\": \"danger\",
        \"fallback\": \"${TITLE}\",
        \"title\": \"${TITLE}\",
        \"text\": \"${MESSAGE}\"
    }]
}" ${WEBHOOKURL} > /dev/null
else
sleep 15

# Slack Title
TITLE=${TITLE:-"Let's Encrypt SSL"}

# Slack Message
MESSAGE=${MESSAGE:-"SSL has updated."}

#POST
curl -s -S -X POST --data-urlencode "payload={
        \"channel\": \"${CHANNEL}\",
        \"username\": \"${BOTNAME}\",
        \"attachments\": [{
        \"color\": \"danger\",
        \"fallback\": \"${TITLE}\",
        \"title\": \"${TITLE}\",
        \"text\": \"${MESSAGE}\"
    }]
}" ${WEBHOOKURL} > /dev/null
fi

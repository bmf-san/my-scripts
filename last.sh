#!/bin/sh

#Import config
. ./conf/slack.conf

if ! last ; then
# Slack Title
TITLE=${TITLE:-"[FAILED] Server Login History"}

# Slack Message
MESSAGE=`last`

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
}" ${WEBHOOKURL} >/dev/null
else
# Slack Title
TITLE=${TITLE:-"Server Login History"}

# Slack Message
MESSAGE=`last`

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
}" ${WEBHOOKURL} >/dev/null
fi

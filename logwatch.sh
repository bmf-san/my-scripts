#!/bin/sh

#Import config
. ./conf/slack.conf

#POST
if ! logwatch --print ; then
# Slack Title
TITLE=${TITLE:-"[FAILED] Logwatch"}

# Slack Message
MESSAGE=`logwatch --print`

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
"_logwatch.sh" 45L, 1332C                                                                                                                                                                                                   1,1          先頭
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
TITLE=${TITLE:-"Logwatch"}

# Slack Message
MESSAGE=`logwatch --print`

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

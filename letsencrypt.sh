#!/bin/sh

# Import config
. ./conf/slack.conf

if ! /var/www/ssl-proof/rancher/.well-known/certbot-auto renew --force-renew ; then
sleep 15

# Slack Title
TITLE=${TITLE:-"Let's Encrypt更新エラー通知"}

# Slack Message
MESSAGE=${MESSAGE:-"証明書の更新に失敗しました。"}

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
TITLE=${TITLE:-"Let's Encrypt更新完了通知"}

# Slack Message
MESSAGE=${MESSAGE:-"証明書を更新しました！"}

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

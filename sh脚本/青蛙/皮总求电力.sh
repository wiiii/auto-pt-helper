#!/bin/bash

# 定义变量
COOKIE="填写自己的cookie"
CALL_TYPE="蛙总，求上传"

mkdir -p /home/qingwa

echo > /home/qingwa/index.html

chmod -R 777 /home/qingwa/*

# 求上传
curl -X GET "https://qingwapt.com/shoutbox.php" \
--data-urlencode "shbox_text=$CALL_TYPE" \
--data-urlencode "shout=我喊" \
--data-urlencode "sent=yes" \
--data-urlencode "type=shoutbox" \
-H "Cookie: $COOKIE" | tee /home/qingwa/index.html

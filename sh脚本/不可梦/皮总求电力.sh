#!/bin/bash

# 定义变量
COOKIE="填写自己的cookie"
#CALL_TYPE="皮总，求电力"
CALL_TYPE="皮总，求上传"

mkdir -p /home/zmpt

echo > /home/zmpt/index.html

chmod -R 777 /home/zmpt/*

# 释放技能
curl -X GET "https://zmpt.cc/shoutbox.php" \
--data-urlencode "shbox_text=$CALL_TYPE" \
--data-urlencode "shout=我喊" \
--data-urlencode "sent=yes" \
--data-urlencode "type=shoutbox" \
-H "Cookie: $COOKIE" | tee /home/zmpt/index.html

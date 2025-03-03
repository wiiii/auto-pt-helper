#!/bin/bash

# 定义变量
COOKIE="填写自己的cookie"

mkdir -p /home/qingwa

echo > /home/qingwa/index.html

chmod -R 777 /home/qingwa/*

# 释放技能
curl -X GET "https://zmpt.cc/shoutbox.php" \
--data-urlencode "shbox_text=蛙总，求上传" \
--data-urlencode "shout=我喊" \
--data-urlencode "sent=yes" \
--data-urlencode "type=shoutbox" \
-H "Cookie: $COOKIE" | tee /home/qingwa/index.html

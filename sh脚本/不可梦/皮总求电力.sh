#!/bin/bash

# 定义变量
COOKIE="填写自己的cookie"

mkdir -p /home/zhuque

echo > /home/zhuque/index.html

chmod -R 777 /home/zhuque/*

# 释放技能
curl -X GET "https://zmpt.cc/shoutbox.php" \
--data-urlencode "shbox_text=皮总，求电力" \
--data-urlencode "shout=我喊" \
--data-urlencode "sent=yes" \
--data-urlencode "type=shoutbox" \
-H "Cookie: $COOKIE" | tee /home/zmpt/index.html

#!/bin/bash

# 定义变量
X_CSRF_TOKEN="填写自己的token"
COOKIE="填写自己的cookie"

mkdir -p /home/zhuque

echo > /home/zhuque/fireGenshinCharacterMagic.json

chmod -R 777 /home/zhuque/*
# 释放技能
curl -X POST https://zhuque.in/api/gaming/fireGenshinCharacterMagic \
-H "Content-Type: application/json" \
-H "X-Csrf-Token: $X_CSRF_TOKEN" \
-H "Cookie: $COOKIE" \
-d '{
    "all": 1,
    "resetModal": true
}' | tee /home/zhuque/fireGenshinCharacterMagic.json

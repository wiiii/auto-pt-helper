#!/bin/bash

# 定义变量
X_CSRF_TOKEN="填写自己的token"
COOKIE="填写自己的cookie"

mkdir -p /home/zhuque

echo > /home/zhuque/fireGenshinCharacterMagic.json
echo > /home/zhuque/listGenshinCharacter.json
echo > /home/zhuque/trainGenshinCharacter.json
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

# 查询角色列表
curl -X GET https://zhuque.in/api/gaming/listGenshinCharacter \
-H "Content-Type: application/json" \
-H "X-Csrf-Token: $X_CSRF_TOKEN" \
-H "Cookie: $COOKIE" \
-d '{
    "all": 1,
    "resetModal": true
}' -o /home/zhuque/listGenshinCharacter.json

min_level=$(jq '.data.characters[].info.level' /home/zhuque/listGenshinCharacter.json | sort -n | head -n 1)

echo "最低等级是: $min_level"

new_level=$((min_level + 1))

echo "升级的最低等级是: $new_level"

# 给所有角色升级
curl -X POST https://zhuque.in/api/gaming/trainGenshinCharacter \
-H "Content-Type: application/json" \
-H "X-Csrf-Token: $X_CSRF_TOKEN" \
-H "Cookie: $COOKIE" \
-d "{
    \"resetModal\": false,
    \"level\": $new_level
}" | tee /home/zhuque/trainGenshinCharacter.json
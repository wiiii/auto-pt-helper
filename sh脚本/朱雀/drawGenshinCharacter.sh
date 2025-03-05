#!/bin/bash

X_CSRF_TOKEN="填写自己token"
COOKIE="填写自己的cookie"

curl -X POST https://zhuque.in/api/gaming/drawGenshinCharacter \
-H "Content-Type: application/json" \
-H "X-Csrf-Token: $X_CSRF_TOKEN" \
-H "Cookie: $COOKIE" \
-d '{
"count": 100,
"type": 1
}'

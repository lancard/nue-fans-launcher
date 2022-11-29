#!/bin/bash
curl \
  -F 'payload_json={"username": "test", "content": "hello"}' \
  -F "file1=@app/app-debug.apk" \
  $DISCORD_WEBHOOK

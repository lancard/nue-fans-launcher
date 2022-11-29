#!/bin/bash
curl \
  -F 'payload_json={"content": "debug apk built: "}' \
  -F "file1=@app/app-debug.apk" \
  $DISCORD_WEBHOOK

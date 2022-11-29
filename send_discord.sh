#!/bin/bash
curl \
  -F 'payload_json={"content": "debug apk buil: "}' \
  -F "file1=@app/app-debug.apk" \
  $DISCORD_WEBHOOK

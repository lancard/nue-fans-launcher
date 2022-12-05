#!/bin/bash

curl \
  -F 'payload_json={"content": "debug apk: "}' \
  -F "file1=@app/app-debug.apk" \
  $DISCORD_WEBHOOK

curl \
  -F 'payload_json={"content": "release aab: "}' \
  -F "file1=@app/app-release.aab" \
  $DISCORD_WEBHOOK
#!/bin/bash

# Copy policies.json to Firefox distribution folder (requires sudo)
sudo cp policies.json /usr/lib/firefox/distribution/

# Copy user.js to the default Firefox profile directory
PROFILE_DIR=$(find "$HOME/.mozilla/firefox/" -maxdepth 1 -type d -name '*.default-release' | head -n 1)

if [ -z "$PROFILE_DIR" ]; then
  echo "Firefox default-release profile not found"
  exit 1
fi

cp user.js "$PROFILE_DIR/"

echo "Done."

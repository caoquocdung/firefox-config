#!/bin/bash

# Extract repo name from URL (last part without .git)
REPO_DIR="firefox-config"

# Change directory to the cloned repo
cd "$REPO_DIR" || { echo "Failed to enter directory $REPO_DIR"; exit 1; }

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

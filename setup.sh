#!/bin/bash

# Copy policies.json to Firefox distribution folder (requires sudo)
sudo cp policies.json /usr/lib/firefox/distribution/

# Locate Firefox default-release profile directory
PROFILE_DIR=$(find "$HOME/.mozilla/firefox/" -maxdepth 1 -type d -name '*.default-release' | head -n 1)

if [ -z "$PROFILE_DIR" ]; then
  echo "Firefox default-release profile not found"
  exit 1
fi

# 🗂 Create backup path by replacing 'default-release' with 'backup'
BACKUP_DIR="${PROFILE_DIR/default-release/backup}"

# 🔁 Copy the entire profile directory to the backup directory
cp -r "$PROFILE_DIR" "$BACKUP_DIR"

echo "✅ Profile backup created at: $BACKUP_DIR"

# 📄 Copy user.js to the original profile
cp user.js "$PROFILE_DIR/"

echo "✅ user.js copied to: $PROFILE_DIR"
echo "✅ Done."

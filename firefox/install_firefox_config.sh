#!/usr/bin/env bash
set -euo pipefail

BASEDIR="$(cd "$(dirname "$0")" && pwd)"
PROFILE_ROOT="${HOME}/Library/Application Support/Firefox/Profiles"

if [ ! -d "$PROFILE_ROOT" ]; then
  echo "Firefox profiles folder not found: $PROFILE_ROOT"
  exit 1
fi

# If a single profile name is passed as argument, target only that profile
if [ "$#" -ge 1 ]; then
  TARGET_NAME="$1"
  if [ -d "$PROFILE_ROOT/$TARGET_NAME" ]; then
    PROFILES=("$PROFILE_ROOT/$TARGET_NAME")
  else
    echo "Profile not found: $TARGET_NAME"
    echo "Available profiles:" && ls -1 "$PROFILE_ROOT"
    exit 2
  fi
else
  PROFILES=("$PROFILE_ROOT"/*)
fi

PREF_LINE='user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);'

for profile in "${PROFILES[@]}"; do
  [ -d "$profile" ] || continue
  echo "Configuring profile: $profile"

  mkdir -p "$profile/chrome"

  if [ -d "$BASEDIR/chrome" ]; then
    echo " Copying chrome files..."
    cp -r "$BASEDIR/chrome/." "$profile/chrome/" || true
  else
    echo " No chrome folder found in $BASEDIR"
  fi

  userjs="$profile/user.js"
  if [ -f "$userjs" ]; then
    if ! grep -Fq 'toolkit.legacyUserProfileCustomizations.stylesheets' "$userjs"; then
      echo "$PREF_LINE" >> "$userjs"
      echo " Appended preference to $userjs"
    else
      echo " Preference already present in $userjs"
    fi
  else
    echo "$PREF_LINE" > "$userjs"
    echo " Created $userjs with preference"
  fi

  echo " Done for $profile"
done

echo "\nAll profiles configured. Restart Firefox to apply the stylesheet changes."
echo "If changes don't appear, open about:config and set 'toolkit.legacyUserProfileCustomizations.stylesheets' to true for the active profile."

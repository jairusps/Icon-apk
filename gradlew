#!/usr/bin/env sh
set -eu
VERSION=8.9
BASE="${GRADLE_USER_HOME:-$HOME/.gradle}/whitelines-bootstrap/gradle-$VERSION"
if [ ! -x "$BASE/bin/gradle" ]; then
  mkdir -p "$(dirname "$BASE")"
  TMP="${TMPDIR:-/tmp}/whitelines-gradle-$VERSION.zip"
  if command -v curl >/dev/null 2>&1; then curl -fL "https://services.gradle.org/distributions/gradle-$VERSION-bin.zip" -o "$TMP"; else wget -O "$TMP" "https://services.gradle.org/distributions/gradle-$VERSION-bin.zip"; fi
  unzip -q -o "$TMP" -d "$(dirname "$BASE")"
  rm -f "$TMP"
fi
exec "$BASE/bin/gradle" "$@"

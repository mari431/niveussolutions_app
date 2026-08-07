#!/bin/bash

set -e

FLUTTER_VERSION="3.44.4"
FLUTTER_DIR="$HOME/flutter"

echo "=== Installing Flutter $FLUTTER_VERSION ==="

git clone \
  --depth 1 \
  --branch "$FLUTTER_VERSION" \
  https://github.com/flutter/flutter.git \
  "$FLUTTER_DIR"

export PATH="$FLUTTER_DIR/bin:$PATH"

echo "=== Flutter Version ==="
flutter --version

echo "=== Enable Web ==="
flutter config --enable-web

echo "=== Pub Get ==="
flutter pub get

echo "=== Flutter Doctor ==="
flutter doctor -v

echo "=== Build Web ==="
flutter build web --release --no-wasm-dry-run

echo "=== Build completed ==="
ls -lah build/web
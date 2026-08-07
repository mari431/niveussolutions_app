#!/bin/bash

set -e

FLUTTER_VERSION="3.44.4"
FLUTTER_DIR="$HOME/flutter"

echo "Installing Flutter $FLUTTER_VERSION..."

git clone \
  --depth 1 \
  --branch "$FLUTTER_VERSION" \
  https://github.com/flutter/flutter.git \
  "$FLUTTER_DIR"

export PATH="$FLUTTER_DIR/bin:$PATH"

echo "Flutter version:"
flutter --version

echo "Enabling Flutter Web..."
flutter config --enable-web

echo "Getting dependencies..."
flutter pub get

echo "Building Flutter Web..."
flutter build web --release
#!/bin/bash

set -e

echo "Installing Flutter 3.7.12..."

curl -L https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.7.12-stable.tar.xz -o flutter.tar.xz

tar xf flutter.tar.xz

export PATH="$PWD/flutter/bin:$PATH"

echo "Flutter version:"
flutter --version

echo "Getting dependencies..."
flutter pub get

echo "Building Flutter Web..."
flutter build web --release

echo "Build completed successfully."

#!/bin/bash
# Usage: ./make_icns.sh <input_image.png>
# Requires: ImageMagick (`magick`) and Apple's `iconutil`

set -e

if [ -z "$1" ]; then
  echo "Usage: $0 <input_image.png>"
  exit 1
fi

INPUT_FILE="$1"

if [ ! -f "$INPUT_FILE" ]; then
  echo "Error: File '$INPUT_FILE' not found."
  exit 1
fi

ICONSET_DIR="icon.iconset"
rm -rf "$ICONSET_DIR"
mkdir "$ICONSET_DIR"

SIZES=(16 32 64 128 256 512 1024)

for SIZE in "${SIZES[@]}"; do
  magick "$INPUT_FILE" -resize "${SIZE}x${SIZE}" "$ICONSET_DIR/icon_${SIZE}x${SIZE}.png"
done

iconutil -c icns "$ICONSET_DIR"

mv icon.icns app.icns

echo "Icon file created: app.icns"

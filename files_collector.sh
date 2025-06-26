#!/bin/bash

# Usage: ./collect_files.sh /path/to/root

ROOT_DIR="$1"
ALL_DIR="$ROOT_DIR/_all"

if [ -z "$ROOT_DIR" ] || [ ! -d "$ROOT_DIR" ]; then
  echo "Usage: $0 /path/to/root-directory"
  exit 1
fi

mkdir -p "$ALL_DIR"

find "$ROOT_DIR" -mindepth 2 -type f | while read -r file; do
  dir=$(dirname "$file")
  parent=$(basename "$dir")

  # Skip _all directory
  if [ "$parent" = "_all" ]; then
    continue
  fi

  base=$(basename "$file")
  newname="${parent}_${base}"

  cp "$file" "$ALL_DIR/$newname"
done

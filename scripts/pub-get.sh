#! /bin/bash

for path in packages apps; do
  for dir in "$path"/*/; do
    [ -f "$dir/pubspec.yaml" ] || continue
    echo "Running pub get in: $dir"
    (cd "$dir" && flutter pub get)
  done
done
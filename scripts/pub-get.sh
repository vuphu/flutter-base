#! /bin/bash

packages_path="$(pwd)/packages"

cd "$packages_path" || exit

for subfolder in */; do
    if [ -d "$subfolder" ]; then
        cd "$subfolder" || exit
        flutter pub get
        cd "$packages_path" || exit
    fi
done

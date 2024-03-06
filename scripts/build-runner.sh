#! /bin/bash

cd packages/core
flutter packages pub run build_runner build --delete-conflicting-outputs

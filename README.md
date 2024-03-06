# flutter-base-structure

- **Install**
```shell
sh scripts/pub-get.sh
```

- **Build runner**

```shell
cd packages/core
flutter packages pub run build_runner build --delete-conflicting-outputs
```
or
```shell
sh scripts/build-runner.sh
```

- **Run on web**

```shell
cd packages/web-app
flutter run -d edge (chrome)
```

![Demo mobile_app](resources/demo_mobile_app.gif)
![Demo web app](resources/demo_web_app.gif)

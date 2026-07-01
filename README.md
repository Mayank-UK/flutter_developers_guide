# flutter_developers_guide

A new Flutter project.

## Environments

Android flavors are configured for dev, staging, and prod. Run each flavor with
the matching Dart entrypoint:

```sh
flutter run --flavor dev -t lib/main_dev.dart
flutter run --flavor staging -t lib/main_staging.dart
flutter run --flavor prod -t lib/main_prod.dart
```

Production builds should use the prod flavor:

```sh
flutter build apk --flavor prod -t lib/main_prod.dart
flutter build appbundle --flavor prod -t lib/main_prod.dart
```

The current Firebase Android config matches the prod package
`com.example.flutter_developers_guide`. To build dev and staging with Firebase,
register Firebase Android apps for:

```text
com.example.flutter_developers_guide.dev
com.example.flutter_developers_guide.staging
```

Then place their `google-services.json` files at:

```text
android/app/src/dev/google-services.json
android/app/src/staging/google-services.json
```

IDE launch configs are also available locally:

- Android Studio / IntelliJ: `Dev`, `Staging`, `Prod`
- VS Code: `Dev`, `Staging`, `Prod`

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Coffee Bean SNS Mobile App

This directory contains a Flutter application that communicates with the Rails API backend.

## Getting Started

1. Ensure that you have the Flutter SDK installed.
2. From this directory, run `flutter pub get` to fetch dependencies.
3. Launch the app with `flutter run` targeting your desired device.

The app now includes a `CoffeeBeanListPage` which fetches beans from the API via
`ApiService`. Modify `baseUrl` in `ApiService` if your backend runs on a
different host.

Ensure the Rails API (see project root README) is running locally so that the app can retrieve data from `GET /api/v1/coffee_beans`.

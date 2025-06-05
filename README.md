# Coffee App Codex

This repository is a monorepo containing:

- **Rails API backend** under the root directory, organized with Packwerk packages.
- **Flutter mobile app** in `mobile_app/` that communicates with the API. It
  includes a simple list screen that fetches coffee beans from the backend.

See `specification/system_design.md` for the system design details.

## Running the Rails API

1. Install dependencies with `bundle install`.
2. Start the server: `bundle exec rails s`.
3. The API will be available at `http://localhost:3000`.

The API currently exposes `GET /api/v1/coffee_beans` which returns sample data.

## Running the Flutter App

Follow the instructions in `mobile_app/README.md` to fetch dependencies and run the app.

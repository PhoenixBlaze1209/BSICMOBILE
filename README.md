# Relay

Relay is a private, single-user reminder app for Android and iOS. It stores tasks on the device, increases reminder frequency as deadlines approach, respects quiet hours, and can require photo proof before a task is completed.

## What works

- Today, Upcoming, All, and Done collections with search and durable Drift storage.
- Create, edit, start, snooze, complete, cancel, delete, and repeat reminders.
- Five urgency levels, per-task priority, bounded snoozing, quiet hours, boot-safe rescheduling, and notification actions.
- Optional camera proof with local image processing and on-device ML Kit checks.
- Optional Gemini verification with a user-provided key stored in the platform secure store.
- Proof history, duplicate-image detection, strict completion, and an audited manual override.
- Local JSON export/import, photo retention controls, theme settings, and reminder diagnostics.

Relay has no account, shared workspace, or cloud database. A proof image is sent to Gemini only when the user explicitly enables cloud verification and supplies a key.

## Build and test

```powershell
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter analyze
flutter test
flutter build apk --release
```

The CI workflow runs analysis, tests, and an Android release build. Local release APKs use the Android debug certificate for direct installation; store distribution requires a private production signing configuration.

## Install

The packaged APK is copied to `dist/Relay-personal-reminders.apk` after verification. Android may ask you to allow installation from the app that opens the file.

See `docs/ARCHITECTURE.md`, `docs/DECISIONS.md`, `docs/TEST_PLAN.md`, and `docs/VERIFICATION.md` for implementation details.

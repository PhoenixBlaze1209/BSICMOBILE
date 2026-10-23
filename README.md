# Relay

Relay is an adaptive Flutter application for task delegation, priority-aware SLAs, and automatic escalation. The domain and application layers are pure Dart; Firebase and Drift are replaceable adapters.

## Toolchain

- Flutter 3.47.7 / Dart 3.13.5
- Node 22 for Cloud Functions
- Firebase Emulator Suite for Auth, Firestore, Functions, and rules tests

Install Flutter at the version in `.fvmrc`, then run:

```powershell
flutter pub get
dart run build_runner build
flutter analyze
flutter test --coverage
flutter run -d chrome --dart-define=RELAY_ENV=dev
```

The default development build uses an in-memory repository with clearly labelled illustrative data. Configure a Firebase project outside the repository and replace the repository provider at bootstrap for connected environments. No Firebase options or secrets are committed.

The locally packaged evaluation APK is `dist/Relay-1.0.0-demo.apk`. It is v2-signed with the local Android debug certificate for direct installation; a store release requires a private production signing key and real Firebase configuration.

## Environments

Android product flavors are `dev`, `staging`, and `prod`. The Dart environment is selected with `--dart-define=RELAY_ENV=<value>`.

```powershell
flutter build apk --flavor prod --dart-define=RELAY_ENV=prod
flutter build web --dart-define=RELAY_ENV=prod
```

## Functions

```powershell
cd functions
npm ci
npm run typecheck
npm test
```

Use a demo project for emulator work:

```powershell
npx firebase-tools emulators:exec --project demo-relay --only firestore,auth,functions "npm --prefix functions test"
```

Architecture and operational contracts are in `docs/`. `docs/VERIFICATION.md` records the current verification evidence and known environment limitations.


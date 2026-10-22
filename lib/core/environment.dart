enum AppEnvironment { dev, staging, prod }

abstract final class Environment {
  static const String _value = String.fromEnvironment(
    'RELAY_ENV',
    defaultValue: 'dev',
  );

  static AppEnvironment get current => switch (_value) {
    'prod' => AppEnvironment.prod,
    'staging' => AppEnvironment.staging,
    _ => AppEnvironment.dev,
  };

  static bool get allowsDemoData => current == AppEnvironment.dev;
}

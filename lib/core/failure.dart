sealed class Failure {
  const Failure(this.message, {this.code});

  final String message;
  final String? code;
}

final class ValidationFailure extends Failure {
  const ValidationFailure(super.message, {super.code});
}

final class InvalidTransitionFailure extends Failure {
  const InvalidTransitionFailure(super.message)
    : super(code: 'invalid-transition');
}

final class PermissionDeniedFailure extends Failure {
  const PermissionDeniedFailure(super.message)
    : super(code: 'permission-denied');
}

final class ConflictFailure extends Failure {
  const ConflictFailure(super.message, {required this.remoteVersion})
    : super(code: 'conflict');

  final int remoteVersion;
}

final class CyclicDependencyFailure extends Failure {
  const CyclicDependencyFailure(super.message)
    : super(code: 'cyclic-dependency');
}

final class NotFoundFailure extends Failure {
  const NotFoundFailure(super.message) : super(code: 'not-found');
}

final class NetworkFailure extends Failure {
  const NetworkFailure(super.message) : super(code: 'network');
}

final class ConfigurationFailure extends Failure {
  const ConfigurationFailure(super.message) : super(code: 'configuration');
}

final class UnexpectedFailure extends Failure {
  const UnexpectedFailure(super.message) : super(code: 'unexpected');
}

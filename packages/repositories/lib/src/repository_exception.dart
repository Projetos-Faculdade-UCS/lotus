/// {@template base_ativo_repository_exception}
/// Exception thrown by the  repository.
/// {@endtemplate}
class RepositoryException implements Exception {
  /// {@macro base_ativo_repository_exception}
  RepositoryException(this.message);

  /// Message describing the exception.
  final String message;

  @override
  String toString() => 'RepositoryException: $message';
}

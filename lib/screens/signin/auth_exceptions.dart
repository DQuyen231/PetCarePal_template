class AuthenticationError implements Exception {
  final String code;

  AuthenticationError(this.code);
}

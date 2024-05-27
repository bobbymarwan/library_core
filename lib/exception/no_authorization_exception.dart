class NoAuthorizationException implements Exception {
  String? message;

  NoAuthorizationException(this.message);

  @override
  String toString() {
    return message ?? "Session expired. Please login";
  }
}
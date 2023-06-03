class HTTPException implements Exception {
  String message;

  HTTPException.fromHTTPError(Map<String, dynamic> error)
      : message = error['Error'];

  HTTPException.fromError(Error error) : message = error.toString();
}

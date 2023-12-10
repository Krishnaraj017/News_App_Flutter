enum ErrorType {
  network,
  api,
  timeout,
  unknown,
  cache,
  tokenExpired,
  incorrectOtp,
  hiveError,
  hiveTypeError,
}

enum ContactType {
  private('Private'),
  business('Business');

  const ContactType(this.type);
  final String type;
}


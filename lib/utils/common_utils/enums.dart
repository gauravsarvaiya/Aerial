part of utils;

enum Status { loading, completed, error, unAuthorised }

enum NetworkMethod {
  get(value: "GET"),
  post(value: "POST");

  const NetworkMethod({required this.value});

  final String value;
}


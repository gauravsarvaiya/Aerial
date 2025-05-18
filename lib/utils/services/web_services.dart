part of utils;


class WebService {
  WebService();

  static final _instance = WebService();

  static WebService get instance => _instance;
  final _dio = Dio();

  final SecureStorage secureStorage = SecureStorage();

  Future<dynamic> get({required NetworkRequest request}) async {
    final token = await secureStorage.getToken();

    try {
      final response = await _dio.get(
        request.url,
        queryParameters: request.queryParameters,
        options: Options(headers: {"x-csrf-token": token}),
      );
      _logResponse(request, response);
      return response.data;
    } on DioException catch (e) {
      decodeErrorResponse(error: e, request: request);
    }
  }

  Future<dynamic> post({required NetworkRequest request}) async {
    final token = await secureStorage.getToken();
    log("===== CSRF token POST ==== $token");

    try {
      final response = await _dio.post(
        request.url,
        queryParameters: request.queryParameters,
        data: request.data,
        options: Options(headers: {
          "Content-Type": "application/json",
        }),
      );
      _logResponse(request, response);
      return response.data;
    } on DioException catch (e) {
      decodeErrorResponse(error: e, request: request);
      rethrow; // ensure exception is thrown
    }
  }


  void _logResponse(NetworkRequest request, Response response) {
    if (kDebugMode) {
      log(request.toResponseString(response.data));
    }
  }
  void decodeErrorResponse({
    required DioException error,
    required NetworkRequest request,
  }) {
    final statusCode = error.response?.statusCode;
    final responseData = error.response?.data;

    log("statusCode ==== $statusCode");
    log("responseData ==== $responseData");

    // Default fallback
    String message = "Something went wrong.";


    if (responseData != null) {
      if (responseData is Map<String, String>) {
        if (responseData["message"] != null) {
          message = responseData["message"].toString();
        } else if (responseData["error"] != null) {
          message = responseData["error"].toString();
        }
      } else if ((statusCode == 400 ) || (statusCode == 401 ) ) {
        message = "Incorrect username or password. Please try again.";
      }
    }

    log(request.toErrorString(error));

    // ✅ Only throw the clean message string
    throw message;
  }




}

class NetworkRequest {
  final String url;
  final Map<String, dynamic>? queryParameters;
  final dynamic data;

  NetworkMethod method = NetworkMethod.post;

  NetworkRequest({required this.url, this.queryParameters, this.data, NetworkMethod? method}) : method = method ?? NetworkMethod.post;

  String toErrorString(DioException error) {
    try {

      final uri = Uri.parse(url);

      final log = '''===⚠️ START ERROR ⚠️===
      
      API is for ${uri.pathSegments.last}
      URL = ${Uri(queryParameters: queryParameters, host: uri.host, path: uri.path, scheme: uri.scheme, port: uri.port, userInfo: uri.userInfo)}
      Data = ${getFormData()}
      queryParameters = $queryParameters
      Code = ${error.response?.statusCode}
      Error:
        Error Response is for this ${error.response?.toString()}
        Error = ${error.error?.toString()} - ${error.response?.statusCode}
        
===⚠️ END ERROR ⚠️===''';

      return log;
    } catch (e) {
      return '''===⚠️ START ERROR ⚠️===
      
      URL = $url
      Data = ${getFormData()}
      Error:
        Error Response is for this ${error.response?.toString()}
        Error = ${error.error?.toString()} - ${error.response?.statusCode}
        
===⚠️ END ERROR ⚠️===''';
    }
  }

  String toResponseString(dynamic response) {
    try {
      final uri = Uri.parse(url);

      final log = '''===👍️ START RESPONSE 👍===
        
      API is for ${uri.pathSegments.last}
      URL = ${Uri(queryParameters: queryParameters, host: uri.host, path: uri.path, scheme: uri.scheme, port: uri.port, userInfo: uri.userInfo)}
      Data = ${getFormData()}
      header data = 
      Response:
        $response
        
===👍️ END RESPONSE 👍===''';

      return log;
    } catch (e) {
      return '''===👍️ START RESPONSE 👍===
      
      URL = $url
      Data = ${getFormData()}
      Response:
        $response
        
===👍️ END RESPONSE 👍===
      ''';
    }
  }

  dynamic getFormData() {
    if(data is FormData) {
      final formData = data as FormData;
      return formData.fields;
    } else {
      return data;
    }
  }

  @override
  toString() {
    try {
      final uri = Uri.parse(url);

      final log = '''===🌐 START REQUEST 🌐===
      
      API is for ${uri.pathSegments.last}
      URL = ${Uri(queryParameters: queryParameters, host: uri.host, path: uri.path, scheme: uri.scheme, port: uri.port, userInfo: uri.userInfo)}
      Data = ${getFormData()}
      
      ===🌐 END REQUEST 🌐===''';

      return log;
    } catch (e) {
      return "API is for $url\nQuery = $queryParameters\n Data = $data";
    }
  }
}

class UnauthorisedException implements Exception {
  @override
  String toString() => 'UnauthorisedException';
}

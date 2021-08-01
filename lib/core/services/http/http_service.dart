

abstract class HttpService {
  /// Send GET request to endpoint/[route] and return the `response`
  /// - if successful: returns decoded json data
  ///
  /// - throws `NetworkException` if GET fails
  Future<dynamic> getHttp(String route, {Map<String, dynamic> params});

  /// Set the header to use for further requests
  setHeader();

  /// Clear headers set
  clearHeaders();

  void dispose();
}
///
/// This class contains all URL which is being called to fetch data from server
///
class ApiClient {
  static String baseUrl = 'https://jsonplaceholder.typicode.com/';
  final String jsonHeaderName = 'Content-Type';
  final String jsonHeaderValue = 'application/json; charset=UTF-8';
  static const String contentType = 'application/json; charset=UTF-8';
  final int successResponse = 200;

  Map<String, String> getJsonHeader() {
    final header = <String, String>{};
    header[jsonHeaderName] = jsonHeaderValue;
    return header;
  }

  static final String post = '${baseUrl}posts';
}

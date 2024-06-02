import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiClient {
  ApiClient();

  static const String baseUrl =
      'https://data.cityofnewyork.us/resource/8wbx-tsch.json';

  Future<Response> fetchData(int page) async {
    final response = await http.get(_constructUrl(page));

    return response;
  }

  _constructUrl(int page) {
    final offset = page * 10;
    return Uri.parse('$baseUrl?\$limit=20&\$offset=$offset');
  }
}

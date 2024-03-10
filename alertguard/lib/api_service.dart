// api_service.dart
import 'package:http/http.dart' as http;

class ApiService {
  static const String apiKey = 'qwyuiadfghjkhgffg';
  static const String apiUrl = 'https://api.predicthq.com/v1/events';

  Future fetchData() async {
    final response = await http.get(Uri.parse('$apiUrl?apikey=$apiKey'));

    if (response.statusCode == 200) {
      // Handle successful API response
      return response.body;
    } else {
      throw Exception('Failed to load data');
    }
  }
}

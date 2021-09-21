import 'package:http/http.dart' as http;

class DataService {
  Future<String> makeRequestToApi() async {
    //https://jsonplaceholder.typicode.com/users
    final uri = Uri.http('jsonplaceholder.typicode.com', '/users');
    final response = await http.get(uri);

    return response.body;
  }
}

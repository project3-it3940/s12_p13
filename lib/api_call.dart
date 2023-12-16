import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiCall {
  Future<String?> getRandomFact() async {
    var response = await http.get(Uri.parse('https://catfact.ninja/fact'));
    print(response);
    String result = jsonDecode(response.body)['fact'];
    print(result);
    return result;
  }

  Future<bool> registerAPI(String uname, String email, String password) async {
    var response = await http.post(
      Uri.parse('http://restapi.adequateshop.com/api/authaccount/registration'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'name': uname, 'email': email, 'password': password}),
    );
    var result = jsonDecode(response.body);
    print(result);
    if (result['message'] == 'success') {
      return true;
    }
    return false;
  }

  Future<bool> loginAPI(String email, String password) async {
    var response = await http.post(
      Uri.parse('http://restapi.adequateshop.com/api/authaccount/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );
    var result_1 = jsonDecode(response.body);
    print(result_1);
    if (result_1['message'] == 'success') {
      return true;
    }
    return false;
  }
}

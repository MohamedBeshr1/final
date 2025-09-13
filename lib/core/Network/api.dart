import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://your-api-url.com/api"; 

  Future<http.Response> login(String email, String password) async {
    final url = Uri.parse("$baseUrl/login");
    return await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email, "password": password}),
    );
  }

  Future<http.Response> register(
      String name, String phone, String email, String password) async {
    final url = Uri.parse("$baseUrl/register");
    return await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "name": name,
        "phone": phone,
        "email": email,
        "password": password,
      }),
    );
  }
}

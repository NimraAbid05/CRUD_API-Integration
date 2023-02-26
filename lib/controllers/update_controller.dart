import 'dart:convert';
import 'package:http/http.dart' as http;

updateUser(String id, String name, String email) async {
  final url = Uri.parse("https://maaz-api.tga-edu.com/api/users/$id");
  final response = await http.put(url,
      body: jsonEncode({'name': name, 'email': email,}),
      headers: {'content-type': 'application/json'});
  if (response.statusCode == 200) {
    print('User updated successfully');
  } else {
    print('Failed to update user: ${response.reasonPhrase}');
  }
}

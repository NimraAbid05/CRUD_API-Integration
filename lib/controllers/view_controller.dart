import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:update_api/model/usermodel.dart';

getUsers() async {
  const url = "https://maaz-api.tga-edu.com/api/users";
  var baseURL = Uri.parse(url);
  var response = await http.get(baseURL);
  var responseData = jsonDecode(response.body);
  var userData = userModel.fromJson(responseData);
  print(userData.data);
  return userData;
}

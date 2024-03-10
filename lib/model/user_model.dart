import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  int id;
  String name;

  User({required this.id, required this.name});

  factory User.createUser(Map<String, dynamic> object) {
    return User(
        id: object['id'],
        name: object['first_name'] + ' ' + object['last_name']);
  }

  static Future<User> connectToApi(String id) async {
    var apiUrl = Uri.https('reqres.in', 'api/users/' + id);

    var result = await http.get(apiUrl);
    var jsonResult = jsonDecode(result.body);

    var userData = jsonResult['data'] as Map<String, dynamic>;

    print(userData);

    return User.createUser(userData);
  }
}

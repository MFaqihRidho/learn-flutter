import 'dart:convert';

import 'package:http/http.dart' as http;

class PostResult {
  String name;
  String job;
  String created;
  String id;

  PostResult(
      {required this.id,
      required this.name,
      required this.job,
      required this.created});

  factory PostResult.createPostResult(Map<String, dynamic> object) {
    return PostResult(
      id: object['id'],
      name: object['name'],
      job: object['job'],
      created: object['createdAt'],
    );
  }

  static Future<PostResult> connectToApi(String name, String job) async {
    var apiUrl = Uri.https('reqres.in', 'api/users');

    var result = await http.post(apiUrl, body: {
      'name': name,
      'job': job,
    });

    var jsonResult = json.decode(result.body);

    print(jsonResult);

    return PostResult.createPostResult(jsonResult);
  }
}

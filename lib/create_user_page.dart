import 'package:flutter/material.dart';
import 'package:quran_app/model/post_result_create_user_model.dart';
import 'package:quran_app/model/user_model.dart';

class CreateUserPage extends StatefulWidget {
  const CreateUserPage({super.key});

  @override
  State<CreateUserPage> createState() => _CreateUserPageState();
}

class _CreateUserPageState extends State<CreateUserPage> {
  dynamic postResult = null;
  dynamic user = null;
  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Demo API Create User'),
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
            Text(postResult != null
                ? '${postResult.id}, ${postResult.name}, ${postResult.job}, ${postResult.created}'
                : 'Create User Page'),
            Text(isLoading
                ? 'LOADING....'
                : user != null
                    ? '${user.id}, ${user.name}'
                    : 'User'),
            ElevatedButton(
                onPressed: () {
                  PostResult.connectToApi('faqih', 'frontend').then((value) {
                    postResult = value;
                  });
                  setState(() {});
                },
                child: Text('POST')),
            ElevatedButton(
                onPressed: () async {
                  isLoading = true;
                  setState(() {});
                  await User.connectToApi('3').then((value) {
                    user = value;
                  });
                  isLoading = false;
                  setState(() {});
                  setState(() {});
                },
                child: Text(isLoading ? 'LOADING' : 'GET')),
          ])),
    ));
  }
}

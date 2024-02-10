import 'package:flutter/material.dart';
import 'package:quran_app/main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controllerPassword = TextEditingController(text: '');
  TextEditingController controllerUsername = TextEditingController(text: '');

  var errors = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                  errorText:
                      errors.contains('username') ? 'Invalid username' : null),
              onChanged: (value) {
                setState(() {});
                errors.remove('username');
              },
              controller: controllerUsername,
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
                errorText:
                    errors.contains('password') ? 'Invalid password' : null,
              ),
              obscureText: true,
              onChanged: (value) {
                setState(() {});
                errors.remove('password');
              },
              controller: controllerPassword,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text("Login"),
              onPressed: () {
                setState(() {});
                if (controllerPassword.text == '123' &&
                    controllerUsername.text == 'admin') {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return const MainPage();
                  }));
                } else {
                  errors.add('username');
                  errors.add('password');
                }
              },
            ),
          ],
        ),
      )),
    );
  }
}

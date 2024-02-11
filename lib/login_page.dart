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
                  border: const OutlineInputBorder(),
                  filled: true,
                  fillColor: errors.contains('username')
                      ? Colors.red[50]
                      : Colors.lightBlue[50],
                  labelText: 'Username',
                  prefixIcon: const Icon(Icons.person),
                  prefixIconColor:
                      errors.contains('username') ? Colors.red : Colors.blue,
                  hintText: 'Enter your username',
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
                border: const OutlineInputBorder(),
                labelText: 'Password',
                filled: true,
                fillColor: errors.contains('password')
                    ? Colors.red[50]
                    : Colors.lightBlue[50],
                prefixIcon: const Icon(Icons.lock),
                prefixIconColor:
                    errors.contains('password') ? Colors.red : Colors.blue,
                hintText: 'Enter your password',
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

import 'package:flutter/material.dart';
import 'package:quran_app/main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double getSmallDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 2 / 3;
  double getBigDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 7 / 8;
  TextEditingController controllerPassword = TextEditingController(text: '');
  TextEditingController controllerUsername = TextEditingController(text: '');

  var errors = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFe2e8f0),
        body: Stack(
          children: [
            Positioned(
              right: -getSmallDiameter(context) / 3,
              top: -getSmallDiameter(context) / 3,
              child: Container(
                width: getSmallDiameter(context),
                height: getSmallDiameter(context),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        colors: [Color(0xFF60a5fa), Color(0xFF0284c7)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
              ),
            ),
            Positioned(
              left: -getBigDiameter(context) / 4,
              top: -getBigDiameter(context) / 4,
              child: Container(
                child: Center(
                    child: Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                )),
                width: getBigDiameter(context),
                height: getBigDiameter(context),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        colors: [Color(0xFF60a5fa), Color(0xFF0284c7)],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter)),
              ),
            ),
            Positioned(
              right: -getBigDiameter(context) / 2,
              bottom: -getBigDiameter(context) / 2,
              child: Container(
                  width: getBigDiameter(context),
                  height: getBigDiameter(context),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xFFbfdbfe))),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ListView(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5)),
                    margin: const EdgeInsets.fromLTRB(20, 300, 20, 10),
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 25),
                    child: Column(children: [
                      TextField(
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.person,
                              color: errors.contains('username')
                                  ? Colors.red
                                  : const Color(0xFF0284c7),
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF0284c7))),
                            labelText: 'Username',
                            labelStyle: TextStyle(color: Color(0xFF0284c7)),
                            errorText: errors.contains('username')
                                ? 'Invalid username'
                                : null),
                        onChanged: (value) {
                          setState(() {});
                          errors.remove('username');
                        },
                        controller: controllerUsername,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.key,
                              color: errors.contains('password')
                                  ? Colors.red
                                  : const Color(0xFF0284c7),
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF0284c7))),
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Color(0xFF0284c7)),
                            errorText: errors.contains('password')
                                ? 'Invalid password'
                                : null),
                        obscureText: true,
                        onChanged: (value) {
                          setState(() {});
                          errors.remove('password');
                        },
                        controller: controllerPassword,
                      )
                    ]),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 20, 20),
                      child: Text(
                        'FORGOT PASSWORD?',
                        style:
                            TextStyle(color: Color(0xFF0284c7), fontSize: 11),
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: Material(
                        borderRadius: BorderRadius.circular(20),
                        elevation: 2,
                        child: Container(
                          width: 150,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF60a5fa),
                                    Color(0xFF0284c7)
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter)),
                          child: Material(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(20),
                              splashColor: Colors.blue,
                              onTap: () {
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
                              child: const Center(
                                child: Text(
                                  'Sign In',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "DON'T HAVE AN ACCOUNT ?",
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        " SIGN UP",
                        style: TextStyle(
                            color: Color(0xFF0284c7),
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}

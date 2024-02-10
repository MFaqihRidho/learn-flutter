import 'package:flutter/material.dart';
import 'package:quran_app/login_page.dart';
import 'package:quran_app/second_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text('Appbar Example'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return const LoginPage();
                }));
              },
              icon: Icon(Icons.exit_to_app))
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff0096ff), Color(0xff6610f2)],
              begin: Alignment.topLeft,
              end: Alignment(0.8, 1),
            ),
          ),
        ),
      ),
      body: Center(
          child: ElevatedButton(
        child: Text("Go to second page"),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const SecondPage();
          }));
        },
      )),
    );
  }
}

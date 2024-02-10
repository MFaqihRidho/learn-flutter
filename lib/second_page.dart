import 'package:flutter/material.dart';
import 'package:quran_app/main_page.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
          child: ElevatedButton(
        child: Text("Go back to main page"),
        onPressed: () {
          Navigator.pop(context, MaterialPageRoute(builder: (context) {
            return const MainPage();
          }));
        },
      )),
    );
  }
}

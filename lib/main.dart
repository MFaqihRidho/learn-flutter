import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text('Latihan Image')),
      body: (Center(
          child: Container(
        color: Colors.black,
        width: 200,
        height: 200,
        padding: const EdgeInsets.all(3),
        child: Image(
            image: NetworkImage(
                'https://images.pexels.com/photos/214574/pexels-photo-214574.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
            fit: BoxFit.contain),
      ))),
    ));
  }
}

import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flex widget'),
        ),
        body: Center(
            child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Spacer(flex: 1),
            Container(
              height: 100,
              width: 100,
              color: Colors.red,
            ),
            Spacer(flex: 2),
            Container(
              height: 100,
              width: 100,
              color: Colors.green,
            ),
            Spacer(flex: 3),
            Container(
              height: 100,
              width: 100,
              color: Colors.blue,
            )
          ],
        )),
      ),
    );
  }
}

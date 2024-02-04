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
  int number = 0;
  void onPressed() {
    setState(() {
      number += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text('Statefuls widget')),
      body: MyWidget(),
    ));
  }
}

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  List<Widget> widgets = [];

  _MyWidgetState() {
    widgets.add(Text('tes 1'));
    widgets.add(Text('tes 2'));
    widgets.add(Text('tes 3'));
  }

  void addWidget() {
    setState(() {
      widgets.add(Text('tes ${widgets.length + 1}'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Your main content goes here
        Center(
          child: ListView(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [...widgets],
            )
          ]),
        ),

        // The floating button
        Positioned(
            bottom:
                16, // Adjust this value to set the button's vertical position
            right:
                16, // Adjust this value to set the button's horizontal position
            child: ClipOval(
              child: ElevatedButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.all(12.0),
                  ),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    CircleBorder(),
                  ),
                ),
                onPressed: () {
                  // Add your button's functionality here
                  setState(() {
                    widgets.add(Text('tes ${widgets.length + 1}'));
                  });
                },
                child: Icon(
                  Icons.add,
                  size: 36,
                ),
              ),
            )),
      ],
    );
  }
}

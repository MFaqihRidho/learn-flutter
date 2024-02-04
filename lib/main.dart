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
  Color color1 = Colors.blue;
  Color color2 = Colors.red;
  Color targetColor = Colors.grey;
  bool isAccepted = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Draggable'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Draggable<Color>(
                    data: color1,
                    feedback: SizedBox(
                      height: 100,
                      width: 100,
                      child: Material(
                        color: color1.withOpacity(0.5),
                        shape: StadiumBorder(),
                        elevation: 3,
                      ),
                    ),
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: Material(
                        color: color1,
                        shape: StadiumBorder(),
                        elevation: 3,
                      ),
                    ),
                    childWhenDragging: SizedBox(
                      height: 100,
                      width: 100,
                      child: Material(
                        color: Colors.grey,
                        shape: StadiumBorder(),
                      ),
                    ),
                  ),
                  Draggable<Color>(
                    data: color2,
                    feedback: SizedBox(
                      height: 100,
                      width: 100,
                      child: Material(
                        color: color2.withOpacity(0.5),
                        shape: StadiumBorder(),
                        elevation: 3,
                      ),
                    ),
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: Material(
                        color: color2,
                        shape: StadiumBorder(),
                        elevation: 3,
                      ),
                    ),
                    childWhenDragging: SizedBox(
                      height: 100,
                      width: 100,
                      child: Material(
                        color: Colors.grey,
                        shape: StadiumBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              DragTarget<Color>(
                onWillAccept: (value) => true,
                onAccept: (value) {
                  setState(() {
                    isAccepted = true;
                    targetColor = value;
                  });
                },
                builder: (context, candidate, rejected) {
                  return (isAccepted)
                      ? SizedBox(
                          height: 200,
                          width: 200,
                          child: Material(
                            color: targetColor,
                            shape: StadiumBorder(),
                          ),
                        )
                      : SizedBox(
                          height: 200,
                          width: 200,
                          child: Material(
                            color: Colors.grey,
                            shape: StadiumBorder(),
                            elevation: 3,
                          ),
                        );
                },
              )
            ],
          )),
    );
  }
}

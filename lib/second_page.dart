import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quran_app/main_page.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  var months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  var randomComments = Random().nextInt(100);
  var randomLikes = 100 + 1 + Random().nextInt(99);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink.shade300,
        appBar: AppBar(
          title: Text('Custom Card Example'),
          backgroundColor: Colors.red.shade900,
        ),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xFFFE5788), Color(0xFFF56D5D)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
            ),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.6,
                child: Card(
                    child: Stack(
                  children: [
                    Opacity(
                      opacity: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            image: const DecorationImage(
                                image: NetworkImage(
                                    'https://www.toptal.com/designers/subtlepatterns/uploads/memphis-mini.png'),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.35,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4),
                              topRight: Radius.circular(4)),
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://cdn.pixabay.com/photo/2024/01/31/19/56/tulips-8544741_1280.jpg'),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          20,
                          30 + MediaQuery.of(context).size.height * 0.35,
                          20,
                          20),
                      child: Center(
                        child: Column(children: [
                          const Text(
                            'Beautiful Flower',
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xFFF56D5D), fontSize: 25),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 20, 0, 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Posted On :',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text(
                                  '${months[DateTime.now().month - 1]} ${DateTime.now().day}, ${DateTime.now().year}',
                                  style:
                                      const TextStyle(color: Color(0xFFF56D5D)),
                                )
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Spacer(
                                flex: 10,
                              ),
                              Icon(
                                Icons.thumb_up,
                                size: 18,
                                color: Colors.grey,
                              ),
                              Spacer(flex: 1),
                              Text(
                                randomLikes.toString(),
                                style: TextStyle(color: Colors.grey),
                              ),
                              Spacer(
                                flex: 5,
                              ),
                              Icon(
                                Icons.comment,
                                size: 18,
                                color: Colors.grey,
                              ),
                              Spacer(
                                flex: 1,
                              ),
                              Text(
                                randomComments.toString(),
                                style: TextStyle(color: Colors.grey),
                              ),
                              Spacer(flex: 10)
                            ],
                          )
                        ]),
                      ),
                    )
                  ],
                )),
              ),
            )
          ],
        ));
  }
}

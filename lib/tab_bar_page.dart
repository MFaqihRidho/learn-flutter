import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TabBarPage extends StatelessWidget {
  const TabBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    TabBar myTabBar = TabBar(
        indicator: BoxDecoration(
            color: Colors.red,
            border: Border(bottom: BorderSide(color: Colors.blue))),
        tabs: [
          Tab(
            icon: Icon(Icons.qr_code),
            text: 'Qr Code',
          ),
          Tab(
            child: Image(
              fit: BoxFit.cover,
              image: NetworkImage(
                  'https://thumb.viva.id/vivaolret/1265x711/2023/05/21/6469cccfd2712-karina-aespa_olret.jpg'),
            ),
          ),
          Tab(
            icon: Icon(Icons.computer),
          ),
          Tab(
            text: 'Ini Text',
          )
        ]);
    return MaterialApp(
      home: DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              title: Text('Tes'),
              bottom: PreferredSize(
                  preferredSize: Size.fromHeight(myTabBar.preferredSize.height),
                  child: Container(
                    child: myTabBar,
                    color: Colors.amber,
                  )),
            ),
            body: TabBarView(children: [
              Center(
                child: QrImageView(
                  data:
                      'https://www.youtube.com/watch?v=7CFAEXymRvM&list=PLZQbl9Jhl-VACm40h5t6QMDB92WlopQmV&index=33',
                  version: 6,
                  size: 300,
                ),
              ),
              Center(
                child: Text('Karina terlalu cantik'),
              ),
              Center(
                child: Text('Computer'),
              ),
              Center(
                child: Text('Ini Text'),
              ),
            ]),
          )),
    );
  }
}

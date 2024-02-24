import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:audioplayers/audioplayers.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({super.key});

  @override
  State<TabBarPage> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> {
  void playSound() async {
    final player = AudioPlayer();
    await player.play(AssetSource('kontol.mp3'));
  }

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
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ShaderMask(
                        shaderCallback: (rectangle) {
                          return LinearGradient(
                                  colors: [Colors.black, Colors.transparent],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter)
                              .createShader(Rect.fromLTRB(
                                  0, 0, rectangle.width, rectangle.bottom));
                        },
                        blendMode: BlendMode.dstIn,
                        child: Image(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://thumb.viva.id/vivaolret/1265x711/2023/05/21/6469cccfd2712-karina-aespa_olret.jpg'),
                        ),
                      ),
                      Text('Karina terlalu cantik Woi')
                    ]),
              ),
              Center(
                child: ElevatedButton(
                  child: Text('Play audio'),
                  onPressed: () async {
                    playSound();
                  },
                ),
              ),
              Center(
                child: Text('Ini Text'),
              ),
            ]),
          )),
    );
  }
}

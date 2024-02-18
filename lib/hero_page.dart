import 'package:flutter/material.dart';
import 'package:quran_app/hero_page_second.dart';

class HeroPage extends StatefulWidget {
  const HeroPage({super.key});

  @override
  State<HeroPage> createState() => _HeroPageState();
}

class _HeroPageState extends State<HeroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latihan Hero'),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const HeroPageSecond();
          }));
        },
        child: Hero(
          tag: 'ayangkarina',
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: SizedBox(
              height: 100,
              width: 100,
              child: Image(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://thumb.viva.id/vivaolret/1265x711/2023/05/21/6469cccfd2712-karina-aespa_olret.jpg'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

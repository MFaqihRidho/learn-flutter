import 'package:flutter/material.dart';

class HeroPageSecond extends StatelessWidget {
  const HeroPageSecond({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latihan Hero'),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Hero(
          tag: 'ayangkarina',
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: SizedBox(
              height: 200,
              width: 200,
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

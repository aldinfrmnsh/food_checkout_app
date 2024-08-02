import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tentang Kami'),
        backgroundColor: Colors.green[800],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green[800]!, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 16.0),
                Image.asset(
                  'assets/images/about_us.png',
                  height: 200.0,
                  fit: BoxFit.cover,
                ),
                Text(
                  'Warung Tongkrongan Warbuy, atau sering disebut Warung Buyang, adalah sebuah tempat makan yang menjadi favorit bagi banyak kalangan, terutama anak muda dan komunitas lokal. Warung ini terkenal dengan suasana yang santai dan nyaman, menjadikannya tempat yang ideal untuk berkumpul, bercengkrama, dan bersantai bersama teman-teman. Selain menawarkan berbagai macam makanan dan minuman yang lezat dengan harga terjangkau, Warung Buyang juga sering menyelenggarakan berbagai acara seperti live music, nonton bareng, dan kegiatan komunitas lainnya. Dengan konsep yang ramah dan hangat, Warung Buyang menjadi tempat yang pas untuk melepas penat dan menikmati waktu bersama orang-orang terdekat.',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

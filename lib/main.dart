import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FirstScreen(),
    );
  }
}

enum AffirmationTile {
  firstTile(AssetImage("assets/image1.webp"), "Believe in yourself."),
  secondTile(AssetImage("assets/image2.jpg"), "I am strong."),
  thirdTile(AssetImage("assets/image3.jpg"), "Today will be a good day."),
  fourthTile(AssetImage("assets/image4.jpg"), "The future is bright."),
  fifthTile(AssetImage("assets/image5.jpg"), "Tomorrow will be a new day.");

  final String subtitle;
  final AssetImage image;

  const AffirmationTile(this.image, this.subtitle);
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tiles = AffirmationTile.values;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 800,
              width: 300,
              child: ListView.builder(
                itemCount: tiles.length,
                itemBuilder: (context, index) {
                  final tile = tiles[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                            Image(
                              image: tile.image,
                              width: double.infinity,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          const SizedBox(height: 12), // Padding
                          Text(
                            tile.subtitle,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
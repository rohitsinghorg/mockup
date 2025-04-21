import 'package:example/screen/automobile_screen.dart';
import 'package:example/screen/building_screen.dart';
import 'package:example/screen/emoji_screen.dart';
import 'package:example/screen/flower_screen.dart';
import 'package:example/screen/number_screen.dart';
import 'package:example/screen/quote_screen.dart';
import 'package:example/screen/text_screen.dart';
import 'package:example/screen/user_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mockup Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MockupExample(),
    );
  }
}

class MockupExample extends StatelessWidget {
  const MockupExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mockup Example")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => AutomobileScreen()),
                );
              },
              child: Text("Automobile Data"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => BuildingScreen()),
                );
              },
              child: Text("Building Data"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => EmojiScreen()),
                );
              },
              child: Text("Emoji Data"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => FlowerScreen()),
                );
              },
              child: Text("Flower Data"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => QuoteScreen()),
                );
              },
              child: Text("Quote Data"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => UserScreen()),
                );
              },
              child: Text("User Data"),
            ),
            SizedBox(height: 20),
            Divider(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => TextScreen()),
                );
              },
              child: Text("Text Data"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => NumberScreen()),
                );
              },
              child: Text("Number Data"),
            ),
          ],
        ),
      ),
    );
  }
}

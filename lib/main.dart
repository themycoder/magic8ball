import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(Magic8BallApp());

class Magic8BallApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Magic8BallPage(),
    );
  }
}

class Magic8BallPage extends StatefulWidget {
  @override
  _Magic8BallPageState createState() => _Magic8BallPageState();
}

class _Magic8BallPageState extends State<Magic8BallPage> {
  final List<String> responses = [
    "Yes, definitely",
    "Ask again later",
    "Don't count on it",
    "It is certain",
    "Very doubtful",
    "Cannot predict now",
    "Most likely",
    "My sources say no",
    "Outlook not so good",
    "Yes, in due time",
  ];

  String currentResponse = "Ask a question";

  void shakeBall() {
    setState(() {
      currentResponse = responses[Random().nextInt(responses.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Magic 8 Ball'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset('Images/magic8ball.jpg'),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    currentResponse,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),  // Khoảng trống giữa hình ảnh và nút
          ElevatedButton(
            onPressed: shakeBall,
            child: Text('Shake the Ball'),
          ),
          SizedBox(height: 20),  // Khoảng trống giữa nút và cạnh dưới màn hình
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(Musify());
}

class Musify extends StatefulWidget {
  const Musify({Key? key}) : super(key: key);

  @override
  _MusifyState createState() => _MusifyState();
}

class _MusifyState extends State<Musify> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(),
      ),
    );
  }
}

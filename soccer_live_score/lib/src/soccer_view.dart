import 'package:flutter/material.dart';

class SoccerView extends StatefulWidget {
  const SoccerView({Key? key}) : super(key: key);

  @override
  _SoccerViewState createState() => _SoccerViewState();
}

class _SoccerViewState extends State<SoccerView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text(
          'Soccer Board',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: const Color(0xFFFAFAFA),
      ),

      body: FutureBuilder(future: ,builder: ,),
    );
  }
}

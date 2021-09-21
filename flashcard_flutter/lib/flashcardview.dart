import 'package:flutter/material.dart';

class FlashcardView extends StatelessWidget {
  final String text;

  // Constructor
  const FlashcardView({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Center(
        child: Text(text),
      ),
    );
  }
}

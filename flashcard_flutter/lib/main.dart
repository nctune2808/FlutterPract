import 'package:flashcard_flutter/flashcard.dart';
import 'package:flashcard_flutter/flashcardview.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Flashcard> _flashcards = [
    Flashcard(front: "Card1", back: "Welcome1"),
    Flashcard(front: "Card2", back: "Welcome2"),
    Flashcard(front: "Card3", back: "Welcome3"),
    Flashcard(front: "Card4", back: "Welcome4"),
    Flashcard(front: "Card5", back: "Welcome5"),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 250,
                height: 250,
                child: FlipCard(
                    front: FlashcardView(
                      text: _flashcards[currentIndex].front,
                    ),
                    back: FlashcardView(
                      text: _flashcards[currentIndex].back,
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // ignore: deprecated_member_use
                  OutlineButton.icon(
                    onPressed: () {
                      showPrev();
                    },
                    icon: Icon(Icons.chevron_left),
                    label: Text("Prev"),
                  ),
                  // ignore: deprecated_member_use
                  OutlineButton.icon(
                    onPressed: () {
                      showNext();
                    },
                    icon: Icon(Icons.chevron_right),
                    label: Text("Next"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void showNext() {
    setState(() {
      currentIndex = (currentIndex + 1 < _flashcards.length)
          ? currentIndex + 1
          : _flashcards.length - 1;
    });
  }

  void showPrev() {
    setState(() {
      currentIndex = (currentIndex - 1 >= 0) ? currentIndex - 1 : 0;
    });
  }
}

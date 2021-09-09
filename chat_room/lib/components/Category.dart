import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  int selected = 0;
  final List<String> categories = [
    "Messages",
    "Groups",
    "Onlines",
    "Stories",
    "Requests"
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      color: Theme.of(context).primaryColor,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selected = index;
                });
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
                child: Text(
                  categories[index],
                  style: TextStyle(
                    color: index == selected ? Colors.white : Colors.white54,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    letterSpacing: 0.8,
                  ),
                ),
              ),
            );
          }),
    );
  }
}

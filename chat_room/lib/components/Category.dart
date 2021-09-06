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
    "Group",
    "Active",
    "Stories",
    "Requests"
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.0,
      color: Colors.blue,
      child: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index) {
            return Text(categories[index]);
          }),
    );
  }
}

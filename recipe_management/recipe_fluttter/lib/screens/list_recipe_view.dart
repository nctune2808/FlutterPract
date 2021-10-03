import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListRecipeView extends StatelessWidget {
  const ListRecipeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {},
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(color: Colors.lightBlue),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text("Recipe 1"), Text('Description 1')],
            ),
          )
        ],
      ),
    );
  }
}

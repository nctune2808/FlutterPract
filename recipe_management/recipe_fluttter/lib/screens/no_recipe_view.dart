import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoRecipeView extends StatelessWidget {
  const NoRecipeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Icon(
            CupertinoIcons.square_stack_3d_down_right,
            color: Colors.grey,
            size: 50,
          ),
          Text(
            'No recipes to view',
            style: TextStyle(color: Colors.grey),
          ),
          CupertinoButton(
              child: Text('Add new'),
              onPressed: () {
                Navigator.pushNamed(context, '/new');
              })
        ],
      ),
    );
  }
}

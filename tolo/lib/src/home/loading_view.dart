import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Retrieving Data...", style: TextStyle(fontSize: 20)),
          SizedBox(height: 15),
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shoping_list_bloc/auth/auth_repository.dart';
import 'package:shoping_list_bloc/route/router.dart';

class TimelineView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Timeline")),
      body: Center(
        child: Text("GraphQL"),
      ),
    );
  }
}

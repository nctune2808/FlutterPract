import 'package:flutter/material.dart';
import 'package:game/route/router.dart';

Widget ruleBuilder(BuildContext context) {
  return FloatingActionButton(
      child: Icon(Icons.book),
      onPressed: () => Navigator.popAndPushNamed(context, RULE_ROUTE));
}

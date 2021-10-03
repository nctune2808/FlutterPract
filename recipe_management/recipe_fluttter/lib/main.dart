import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_fluttter/screens/all_recipes_view.dart';
import 'package:recipe_fluttter/screens/new_recipe_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (_) => AllRecipesView(),
        '/new': (_) => NewRecipeView(),
      },
    );
  }
}

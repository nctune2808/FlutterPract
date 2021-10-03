import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_fluttter/screens/list_recipe_view.dart';
import 'package:recipe_fluttter/screens/no_recipe_view.dart';

class AllRecipesView extends StatelessWidget {
  const AllRecipesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            largeTitle: Text('All Recipes'),
            trailing: CupertinoButton(
              onPressed: () {
                Navigator.pushNamed(context, '/new');
              },
              child: Icon(
                CupertinoIcons.plus_circle_fill,
                size: 30,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              ListRecipeView(),
              NoRecipeView(),
              // for (var i = 0; i < 100; i++) Text('Recipe $i'),
            ]),
          )
        ],
      ),
    );
  }
}

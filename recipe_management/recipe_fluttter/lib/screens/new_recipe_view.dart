import 'package:flutter/cupertino.dart';

class NewRecipeView extends StatelessWidget {
  const NewRecipeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Add Recipe"),
      ),
      child: CustomScrollView(),
    );
  }
}

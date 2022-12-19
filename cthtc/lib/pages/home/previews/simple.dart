import 'package:cthtc/extension/neumorphism.dart';
import 'package:cthtc/extension/responsive.dart';
import 'package:cthtc/themes/colour.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SimplePreview extends StatefulWidget {
  const SimplePreview({super.key});

  @override
  State<SimplePreview> createState() => _SimplePreviewState();
}

class _SimplePreviewState extends State<SimplePreview> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height,
      child: GridView(
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            // childAspectRatio: context.responsive(df: 7, sm: 4, md: 5, lg: 5),
            childAspectRatio: 1,
            crossAxisCount:
                context.responsive(df: 1, sm: 2, md: 3, lg: 4, xl: 5),
            crossAxisSpacing: 50,
            mainAxisSpacing: 50,
          ),
          children: [
            _cardBuilder(),
            _cardBuilder(),
            _cardBuilder(),
            _cardBuilder(),
            _cardBuilder(),
            _cardBuilder(),
            _cardBuilder(),
            _cardBuilder(),
          ]),
    );
  }

  Widget _cardBuilder() {
    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        // color: Colors.transparent,
        child: Icon(
          Icons.home,
          size: 100,
          color: PrimaryColorDark,
        ),
      ),
      onTap: () {},
    ).addNeumorphism(
        borderRadius: 15,
        bottomShadowColor: PrimaryColorDark,
        topShadowColor: PrimaryColorLight);
  }
}

import 'package:cthtc/extension/neumorphism.dart';
import 'package:cthtc/extension/responsive.dart';
import 'package:cthtc/models/Property.dart';
import 'package:cthtc/src/property/property_bloc.dart';
import 'package:cthtc/themes/colour.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimplePreview extends StatefulWidget {
  const SimplePreview({super.key});

  @override
  State<SimplePreview> createState() => _SimplePreviewState();
}

class _SimplePreviewState extends State<SimplePreview> {
  int length = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PropertyBloc()..add(Fetch_PropertyEvent()),
      child: BlocConsumer<PropertyBloc, PropertyState>(
        listener: (context, state) {
          setState(() {
            length = state.properties!.length;
          });
        },
        builder: (context, state) {
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
              children: List.generate(
                length,
                (index) => _cardBuilder(state.properties![index]!),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _cardBuilder(Property property) {
    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        // color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.home,
              size: 100,
              color: PrimaryColorDark,
            ),
            Text(property.title),
            Text('£' + property.price.toString() + '.00'),
            Text(property.status.toString()),
            Text(property.type.toString())
          ],
        ),
      ),
      onTap: () {},
    ).addNeumorphism(
        borderRadius: 15,
        bottomShadowColor: PrimaryColorDark,
        topShadowColor: PrimaryColorLight);
  }
}

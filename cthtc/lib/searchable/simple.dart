import 'package:cthtc/extension/neumorphism.dart';
import 'package:cthtc/extension/responsive.dart';
import 'package:cthtc/themes/colour.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SimpleSearch extends StatefulWidget {
  const SimpleSearch({super.key});

  @override
  State<SimpleSearch> createState() => _SimpleSearchState();
}

class _SimpleSearchState extends State<SimpleSearch> {
  final formKey = new GlobalKey<FormState>();

  final List<String> _data = ['First', 'Second', 'Third'];
  String _selectedType = 'Select property type';

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        child: GridView.count(
          childAspectRatio: 3,
          crossAxisCount: context.responsive(df: 2, sm: 2, md: 3, lg: 4, xl: 5),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            _itemBuilder(),
            _itemBuilder(),
            _itemBuilder(),
            _itemBuilder(),
            _itemBuilder(),
            _itemBuilder(),
            _itemBuilder(),
            _itemBuilder(),
            _itemBuilder(),
          ],
        )
        //   Container(
        //     padding: EdgeInsets.symmetric(horizontal: 15),
        //     decoration: BoxDecoration(
        //       color: PrimaryColor,
        //       borderRadius: BorderRadius.circular(15),
        //     ),
        //     child: _itemBuilder(),
        //   ).addNeumorphism(
        //       borderRadius: 15,
        //       bottomShadowColor: PrimaryColorDark,
        //       topShadowColor: PrimaryColorLight),
        );
  }

  Widget _itemBuilder() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: PrimaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          items: _data.map((String val) {
            return DropdownMenuItem<String>(
              value: val,
              child: Row(
                children: [
                  Text(val),
                ],
              ),
            );
          }).toList(),
          hint: Row(
            children: [
              Text(_selectedType),
            ],
          ),
          onChanged: (String? val) {
            setState(() {
              _selectedType = val!;
            });
          },
        ),
      ),
    ).addNeumorphism(
        borderRadius: 15,
        bottomShadowColor: PrimaryColorDark,
        topShadowColor: PrimaryColorLight);
  }
}

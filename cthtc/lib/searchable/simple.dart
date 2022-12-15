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
  double _value = 0;
  final List<String> _data = ['First', 'Second', 'Third'];
  String _selectedType = 'Select property type';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all()),
      padding: EdgeInsets.all(30),
      height: MediaQuery.of(context).size.height /
          context.responsive(df: 1, sm: 2, md: 3, lg: 4),
      child: GridView.count(
        childAspectRatio: 5,
        crossAxisCount: context.responsive(df: 1, sm: 2, md: 3, lg: 4, xl: 5),
        crossAxisSpacing: 25,
        mainAxisSpacing: 25,
        children: [
          _itemBuilder(),
          _itemBuilder(),
          _itemBuilder(),
          _itemBuilder(),
          _sliderBuilder(),
          _sliderBuilder(),
        ],
      ),
    );
  }

  Widget _sliderBuilder() {
    return Container(
      decoration: BoxDecoration(
        color: PrimaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Slider(
          min: 0.0,
          max: 1000.0,
          divisions: 20,
          label: _value.toString(),
          value: _value,
          onChanged: (value) {
            setState(() {
              _value = value;
            });
          }),
    ).addNeumorphism(
        borderRadius: 15,
        bottomShadowColor: PrimaryColorDark,
        topShadowColor: PrimaryColorLight);
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

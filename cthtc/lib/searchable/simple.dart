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
  double _startValue = 0;
  double _endValue = 500;
  final List<String> _data = ['First', 'Second', 'Third'];
  String _selectedType = 'Select property type';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all()),
      padding: EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height /
          context.responsive(df: 1.25, sm: 2.25, md: 3),
      child: GridView(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: context.responsive(df: 5, sm: 6, md: 5),
          crossAxisCount: context.responsive(df: 1, sm: 2, md: 3, lg: 4, xl: 5),
          crossAxisSpacing: 25,
          mainAxisSpacing: 25,
        ),
        children: [
          _itemBuilder(),
          _itemBuilder(),
          _itemBuilder(),
          _itemBuilder(),
          _sliderBuilder(symbol1: '£', min: 0.0, max: 1000.0, symbol2: ''),
          _sliderBuilder(symbol1: '', min: 0.0, max: 1000.0, symbol2: ' m²'),
        ],
      ),
    );
  }

  Widget _sliderBuilder({
    required String? symbol1,
    required String? symbol2,
    required double min,
    required double max,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: PrimaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: RangeSlider(
        min: min,
        max: max,
        divisions: 20,
        values: RangeValues(_startValue, _endValue),
        labels: RangeLabels(
          symbol1! + _startValue.toString() + symbol2!,
          symbol1 + _endValue.toString() + symbol2,
        ),
        onChanged: ((values) {
          setState(() {
            _startValue = values.start;
            _endValue = values.end;
          });
        }),
      ),
      // child: Slider(
      //     min: 0.0,
      //     max: 1000.0,
      //     divisions: 20,
      //     label: _value.toString(),
      //     value: _value,
      //     onChanged: (value) {
      //       setState(() {
      //         _value = value;
      //       });
      //     }),
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
          dropdownColor: PrimaryColor,
          borderRadius: BorderRadius.all(Radius.circular(20)),
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

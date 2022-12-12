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
  String _selectedType = 'Please select property type';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      color: PrimaryColor,
      child: Center(
        child: Form(
          key: formKey,
          child: Container(
              color: Colors.red,
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
                      }))),
        ),
      ),
    );
  }
}

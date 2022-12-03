import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class DatePickerFrame extends StatefulWidget {
  const DatePickerFrame({super.key});

  @override
  State<DatePickerFrame> createState() => _DatePickerFrameState();
}

class _DatePickerFrameState extends State<DatePickerFrame> {
  String datetime = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.keyboard_arrow_left_rounded,
                  size: 35,
                )),
            TextButton(
                onPressed: () {
                  DatePicker.showDatePicker(
                    context,
                    showTitleActions: true,
                    currentTime: DateTime.now(),
                    locale: LocaleType.en,
                    theme: DatePickerTheme(
                      // headerColor: Colors.grey,
                      // backgroundColor: Colors.green,
                      itemStyle: TextStyle(
                          // color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                      // doneStyle: TextStyle(color: Colors.white, fontSize: 16)
                    ),
                    onChanged: (date) {
                      print('change $date in time zone ' +
                          date.timeZoneOffset.inHours.toString());
                    },
                    onConfirm: (date) {
                      setState(() {
                        datetime = date.toString();
                      });
                      print('confirm $date');
                    },
                  );
                },
                child: Text(
                  datetime.isEmpty ? "Choose Date" : datetime,
                  // style: TextStyle(color: Colors.green),
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.keyboard_arrow_right_rounded,
                  size: 35,
                )),
          ],
        ),
      ],
    );
  }
}

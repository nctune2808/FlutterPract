import 'package:appointment/data.dart';
import 'package:flutter/material.dart';

import 'time.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body());
  }

  Widget _body() {
    bool _checkMatch(List<Data> d, Time t, int index) {
      for (var i = 0; i < d.length; i++) {
        print(d[i].time == t.time);
        if (d[i].time == t.time) {
          return (d[i].time == t.time && d[i].staff == index.toString());
        }
      }
      return false;
    }

    List<Time> time = [
      Time(hour: '0', interval: 'am', time: '00:00'),
      Time(hour: '1', interval: 'am', time: '01:00'),
      Time(hour: '2', interval: 'am', time: '02:00'),
      Time(hour: '3', interval: 'am', time: '03:00'),
      Time(hour: '4', interval: 'am', time: '04:00'),
      Time(hour: '5', interval: 'am', time: '05:00'),
      Time(hour: '6', interval: 'am', time: '06:00'),
      Time(hour: '7', interval: 'am', time: '07:00'),
      Time(hour: '8', interval: 'am', time: '08:00'),
      Time(hour: '9', interval: 'am', time: '09:00'),
      Time(hour: '10', interval: 'am', time: '10:00'),
      Time(hour: '11', interval: 'am', time: '11:00'),
      Time(hour: '12', interval: 'pm', time: '12:00'),
      Time(hour: '1', interval: 'pm', time: '13:00'),
      Time(hour: '2', interval: 'pm', time: '14:00'),
      Time(hour: '3', interval: 'pm', time: '15:00'),
      Time(hour: '4', interval: 'pm', time: '16:00'),
      Time(hour: '5', interval: 'pm', time: '17:00'),
      Time(hour: '6', interval: 'pm', time: '18:00'),
      Time(hour: '7', interval: 'pm', time: '19:00'),
      Time(hour: '8', interval: 'pm', time: '20:00'),
      Time(hour: '9', interval: 'pm', time: '21:00'),
      Time(hour: '10', interval: 'pm', time: '22:00'),
      Time(hour: '11', interval: 'pm', time: '23:00'),
    ];

    List<Data>? data = [
      Data(title: 'Nails', time: '10:00', staff: '1'),
      Data(title: 'Beauty', time: '05:00', staff: '2'),
      Data(title: 'Spa', time: '09:00', staff: '0'),
    ];

    return SingleChildScrollView(
      // physics: ClampingScrollPhysics(),
      child: Flex(direction: Axis.vertical, children: [
        Container(
          alignment: Alignment.center,
          height: 1600,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) => Container(
              width: 100,
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 24,
                  itemBuilder: (context, nindex) {
                    bool isMatched = false;

                    isMatched = _checkMatch(data, time[nindex], index);

                    return Card(
                      child: ListTile(
                        textColor: isMatched ? Colors.red : Colors.black,
                        title: Text(time[nindex].hour.toString()),
                        onTap: () {},
                      ),
                    );
                  }),
            ),
          ),
        ),
      ]),
    );
  }
}

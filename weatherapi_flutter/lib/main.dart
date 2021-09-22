import 'package:flutter/material.dart';
import 'package:weatherapi_flutter/models.dart';

import 'data_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _cityTextController = TextEditingController();
  final _dataService = DataService();
  var _response;

  void _search() async {
    final response = await _dataService.getWeather(_cityTextController.text);
    setState(() {
      _response = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_response != null)
                Column(
                  children: [
                    Image.network(
                      _response.iconURL,
                    ),
                    Text(
                      "${_response.tempInfo.temperature}",
                      style: TextStyle(fontSize: 40),
                    ),
                    Text(_response.weaInfo.description)
                  ],
                ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: SizedBox(
                  width: 150,
                  child: TextField(
                    controller: _cityTextController,
                    decoration: InputDecoration(labelText: 'City'),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              ElevatedButton(
                child: Text("Search"),
                onPressed: _search,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

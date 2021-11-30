import 'package:flutter/material.dart';
import 'package:transport_real_time/services/bus_api.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final _latitude = TextEditingController();
  final _longitude = TextEditingController();
  var _response;

  void _search() async {
    final response = await BusApi.getBusStationByGeo();
    setState(() {
      _response = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search nearby"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _latitude,
              decoration: InputDecoration(labelText: 'Latitude'),
              textAlign: TextAlign.center,
            ),
            TextField(
              controller: _longitude,
              decoration: InputDecoration(labelText: 'Longitude'),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              child: Text("Search"),
              onPressed: () {
                print("latitude: ${_latitude.text}");
                print("longitude: ${_longitude.text}");
                _search();
              },
            ),
            if (_response != null)
              Expanded(
                child: ListView.builder(
                  itemCount: _response.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Text(_response[index].name),
                        Text(
                            '${_response[index].latitude} : ${_response[index].longitude}'),
                        Text(_response[index].atcocode),
                        Divider()
                      ],
                    );
                  },
                ),
              )
          ],
        ),
      ),
    );
  }
}

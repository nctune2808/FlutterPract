import 'package:flutter/material.dart';
import 'package:transport_real_time/services/bus_api.dart';
import 'package:transport_real_time/views/search/by_atco_view.dart';

class SearchByGeoView extends StatefulWidget {
  const SearchByGeoView({Key? key}) : super(key: key);

  @override
  _SearchByGeoViewState createState() => _SearchByGeoViewState();
}

class _SearchByGeoViewState extends State<SearchByGeoView> {
  final _latitude = TextEditingController(text: '51.5493534');
  final _longitude = TextEditingController(text: '-0.0752424');
  var _response;

  void _search(String lat, String lon) async {
    final response = await BusApi.getBusStationByGeo(lat, lon);
    setState(() {
      _response = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              _search(_latitude.text, _longitude.text);
            },
          ),
          if (_response != null)
            Expanded(
              child: ListView.builder(
                itemCount: _response.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: Column(
                      children: [
                        Text(_response[index].name),
                        Text(
                            '${_response[index].latitude} : ${_response[index].longitude}'),
                        Text(_response[index].atcocode),
                        Text('${_response[index].distance}'),
                        Divider()
                      ],
                    ),
                    onTap: () {
                      print(_response[index].atcocode);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => SearchByAtcoView(
                                  atco: _response[index].atcocode)));
                    },
                  );
                },
              ),
            )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:transport_real_time/models/place_location.dart';
import 'package:transport_real_time/services/place_api.dart';
import 'package:transport_real_time/views/bus/bus_stations_view.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: TextFormField(controller: _searchController)),
        IconButton(
            onPressed: () async {
              if (_searchController.text.isNotEmpty) {
                print(_searchController.text);
                PlaceLocation place =
                    await PlaceApi().getPlace(_searchController.text);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        BusStationsView(lat: place.lat, lng: place.lng),
                  ),
                );
              }
            },
            icon: Icon(Icons.search))
      ],
    );
  }
}

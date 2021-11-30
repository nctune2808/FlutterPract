import 'package:flutter/material.dart';
import 'package:transport_real_time/views/search/by_geo_view.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Search nearby"),
        ),
        body: SearchByGeoView());
  }
}

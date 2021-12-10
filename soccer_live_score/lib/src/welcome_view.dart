import 'package:flutter/material.dart';
import 'package:soccer_live_score/model/country.dart';
import 'package:soccer_live_score/model/team.dart';
import 'package:soccer_live_score/service/api_country.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  _WelcomeViewState createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  List<Country> countries = [];
  int index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCountryList();
    index;
  }

  void _getCountryList() async {
    List<Country> countryList = await CountryApi.getAllCountries();
    setState(() {
      countries = countryList;
    });
  }

  @override
  Widget build(BuildContext context) {
    Team team = Team(
        id: 85,
        logoUrl: 'https://media.;api-sports.io/football/teams/85.png',
        name: 'PSG');

    FixedExtentScrollController fixedExtentScrollController =
        new FixedExtentScrollController();

    return Scaffold(
        appBar: AppBar(title: Text("Football Addicts")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            countries.isNotEmpty ? _countryBuilder() : Container(),
            _leagueBuilder(),
            _clubBuilder(),
          ],
        ));
  }

  Widget _leagueBuilder() {
    return Column(
      children: [
        Text("Select League", style: TextStyle(fontSize: 20)),
        Container(
          height: 100,
          color: Colors.grey,
          child: ListWheelScrollView(
            // controller: fixedExtentScrollController,
            physics: FixedExtentScrollPhysics(),
            squeeze: 2,
            itemExtent: 80,
            perspective: 0.01,
            diameterRatio: 1.5,
            // magnification: 1.5,
            // useMagnifier: true,
            children: [
              _scrollBuilder(),
              _scrollBuilder(),
              _scrollBuilder(),
              _scrollBuilder(),
              _scrollBuilder(),
              _scrollBuilder(),
              _scrollBuilder(),
              _scrollBuilder(),
              _scrollBuilder(),
              _scrollBuilder(),
            ],
            onSelectedItemChanged: (index) => {print(index)},
          ),
        ),
      ],
    );
  }

  Widget _clubBuilder() {
    return Column(
      children: [
        Text("Select Club", style: TextStyle(fontSize: 20)),
        Container(
          height: 100,
          color: Colors.grey,
          child: ListWheelScrollView(
            // controller: fixedExtentScrollController,
            physics: FixedExtentScrollPhysics(),
            squeeze: 2,
            itemExtent: 80,
            perspective: 0.01,
            diameterRatio: 1.5,
            // magnification: 1.5,
            // useMagnifier: true,
            children: [
              _scrollBuilder(),
              _scrollBuilder(),
              _scrollBuilder(),
              _scrollBuilder(),
              _scrollBuilder(),
              _scrollBuilder(),
              _scrollBuilder(),
              _scrollBuilder(),
              _scrollBuilder(),
              _scrollBuilder(),
            ],
            onSelectedItemChanged: (index) => {print(index)},
          ),
        ),
      ],
    );
  }

  Widget _countryBuilder() {
    return Column(
      children: [
        Text("Select Country", style: TextStyle(fontSize: 20)),
        Container(
          height: 100,
          color: Colors.grey,
          child: ListWheelScrollView(
            // controller: fixedExtentScrollController,
            physics: FixedExtentScrollPhysics(),
            squeeze: 2,
            itemExtent: 80,
            perspective: 0.01,
            diameterRatio: 1.5,
            // magnification: 1,
            // useMagnifier: true,
            children: [
              ...countries.map((country) {
                return Center(child: Text(country.name));
              })
            ],
            onSelectedItemChanged: (selected) => {
              setState(() {
                index = selected;
              })
            },
          ),
        ),
        Image.network(
          countries[index].flag,
          width: 100,
          height: 100,
        ),
      ],
    );
  }

  Widget _scrollBuilder() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.ac_unit),
        Text("data"),
      ],
    );
  }
}

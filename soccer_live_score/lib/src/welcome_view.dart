import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:soccer_live_score/model/country.dart';
import 'package:soccer_live_score/model/league.dart';
import 'package:soccer_live_score/model/team.dart';
import 'package:soccer_live_score/service/api_country.dart';
import 'package:soccer_live_score/service/api_league.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  _WelcomeViewState createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  List<Country> countries = [];
  List<League> leagues = [];
  int index = -1;

  FixedExtentScrollController _leagueController =
      FixedExtentScrollController(initialItem: 0);

  @override
  void initState() {
    super.initState();
    _getCountryList();
    // index;
  }

  void _getCountryList() async {
    List<Country> countryList = await CountryApi.getAllCountries();
    setState(() {
      countries = countryList;
    });
  }

  void _getLeagueList(String name) async {
    leagues.clear();
    List<League> leagueList = await LeagueApi.getLeague(name);
    setState(() {
      leagues = leagueList;
    });
  }

  @override
  Widget build(BuildContext context) {
    Team team = Team(
        id: 85,
        logoUrl: 'https://media.;api-sports.io/football/teams/85.png',
        name: 'PSG');

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

// physics: FixedExtentScrollPhysics(),
// squeeze: 2,
// itemExtent: 80,
// perspective: 0.01,
// diameterRatio: 1.5,

  Widget _leagueBuilder() {
    return Column(
      children: [
        Text("Select League", style: TextStyle(fontSize: 20)),
        SizedBox(height: 10),
        Container(
          height: 100,
          color: Colors.black26,
          child: ListWheelScrollView(
            controller: _leagueController,
            // physics: FixedExtentScrollPhysics(),
            squeeze: 2,
            itemExtent: 80,
            perspective: 0.01,
            diameterRatio: 1.5,
            // magnification: 1.25,
            // useMagnifier: true,
            children: leagues
                .map((league) => Center(child: Text(league.info.name)))
                .toList(),
            onSelectedItemChanged: (value) {
              setState(() {
                index = value;
              });
              print(value);
            },
          ),
        ),
        index > -1
            ? Image.network(
                leagues[index].info.logo!,
                height: 100,
              )
            : Container()
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
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Text("Select Country", style: TextStyle(fontSize: 20)),
          SizedBox(height: 10),
          DropdownSearch<String>(
            mode: Mode.DIALOG,
            showSearchBox: true,
            showSelectedItems: true,
            // compareFn: (item, selectedItem) => item?.id == selectedItem?.id,
            items: countries.map((country) => country.name).toList(),
            onChanged: (value) {
              _leagueController.initialItem;
              _getLeagueList(value.toString());
            },
          ),

          // Container(
          //   height: 100,
          //   color: Colors.grey,
          //   child: ListWheelScrollView(
          //     // controller: fixedExtentScrollController,
          //     physics: FixedExtentScrollPhysics(),
          //     squeeze: 2,
          //     itemExtent: 80,
          //     perspective: 0.01,
          //     diameterRatio: 1.5,
          //     // magnification: 1,
          //     // useMagnifier: true,
          //     children: [
          //       ...countries.map((country) {
          //         return Center(child: Text(country.name));
          //       })
          //     ],
          //     onSelectedItemChanged: (selected) => {
          //       setState(() {
          //         index = selected;
          //       })
          //     },
          //   ),
          // ),
        ],
      ),
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

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
  List<Team> teams = [];

  int c_index = 0;
  int index = 0;

  FixedExtentScrollController _leagueController = FixedExtentScrollController();

  @override
  void initState() {
    super.initState();
    _getCountryList();
    // index;
  }

  void _getCountryList() async {
    leagues.clear();
    List<Country> countryList = await CountryApi.getAllCountries();
    setState(() {
      countries = countryList;
    });
  }

  void _getLeagueList(String code) async {
    List<League> leagueList = await LeagueApi.getLeague(code);
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
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            countries.isNotEmpty ? _countryBuilder() : Container(),
            leagues.isNotEmpty ? _leagueBuilder() : Container(),
            teams.isNotEmpty ? _clubBuilder() : Container(),
          ],
        ));
  }

  Widget _leagueBuilder() {
    return Column(
      children: [
        Text("Select League", style: TextStyle(fontSize: 20)),
        SizedBox(height: 10),
        Container(
          height: 100,
          color: Colors.black12,
          child: ListWheelScrollView(
            controller: _leagueController,
            physics: FixedExtentScrollPhysics(),
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
            },
          ),
        ),
        SizedBox(height: 10),
        Image.network(
          leagues[index].info.logo!,
          height: 100,
        )
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
            ],
            onSelectedItemChanged: (index) => {},
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
          DropdownSearch<Country>(
            mode: Mode.DIALOG,
            showSearchBox: true,
            showSelectedItems: true,
            compareFn: (item, selectedItem) => item?.name == selectedItem?.name,
            items: countries.map((country) => country).toList(),
            itemAsString: (item) {
              return item!.name;
            },
            onChanged: (value) {
              _getLeagueList(value!.code);
              _leagueController.jumpToItem(0);
            },
          ),
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

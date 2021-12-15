import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:soccer_live_score/model/country.dart';
import 'package:soccer_live_score/model/league.dart';
import 'package:soccer_live_score/model/team.dart';
import 'package:soccer_live_score/service/api_country.dart';
import 'package:soccer_live_score/service/api_league.dart';
import 'package:soccer_live_score/service/api_team.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  _WelcomeViewState createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  List<Country> countries = [];
  List<League> leagues = [];
  List<Team> teams = [];

  int l_index = 0;
  int t_index = 0;

  FixedExtentScrollController _leagueController = FixedExtentScrollController();
  FixedExtentScrollController _teamController = FixedExtentScrollController();

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
    teams.clear();
    List<League> leagueList = await LeagueApi.getLeague(code);
    setState(() {
      leagues = leagueList;
    });
  }

  void _getTeamList(int leagueId) async {
    List<Team> teamList = await TeamApi.getTeams(leagueId);
    setState(() {
      teams = teamList;
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
            teams.isNotEmpty ? _teamBuilder() : Container(),
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
              _getTeamList(leagues[value].info.id);
              _teamController.jumpToItem(0);
              setState(() {
                l_index = value;
              });
            },
          ),
        ),
        SizedBox(height: 10),
        Image.network(
          leagues[l_index].info.logo!,
          height: 100,
        )
      ],
    );
  }

  Widget _teamBuilder() {
    print("team");
    // _getTeamList(leagues[0].info.id);
    return Column(
      children: [
        Text("Select Team", style: TextStyle(fontSize: 20)),
        Container(
          height: 100,
          color: Colors.grey,
          child: ListWheelScrollView(
            controller: _teamController,
            physics: FixedExtentScrollPhysics(),
            squeeze: 2,
            itemExtent: 80,
            perspective: 0.01,
            diameterRatio: 1.5,
            children:
                teams.map((team) => Center(child: Text(team.name!))).toList(),
            onSelectedItemChanged: (value) => {
              setState(() {
                t_index = value;
              })
            },
          ),
        ),
        Image.network(
          teams[t_index].logoUrl!,
          height: 100,
        )
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
}

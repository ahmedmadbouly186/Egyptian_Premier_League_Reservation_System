import 'package:flutter/material.dart';
import 'package:web_frontend/src/components/appbar.dart';
import 'package:web_frontend/src/components/match_component.dart';
import 'package:web_frontend/src/controller/match.dart';
import '../models/match.dart';

class PreviousMatchesScreen extends StatefulWidget {
  @override
  State<PreviousMatchesScreen> createState() => _PreviousMatchesScreenState();
}

class _PreviousMatchesScreenState extends State<PreviousMatchesScreen> {
  final res = {
    "upcomming": [
      {
        "home_team": "Team A",
        "away_team": "Team B",
        "match_id": 1,
        "date_time": "date_time"
      },
      {
        "home_team": "Team C",
        "away_team": "Team D",
        "match_id": 2,
        "date_time": "date_time"
      },
      {
        "home_team": "Team C",
        "away_team": "Team D",
        "match_id": 2,
        "date_time": "date_time"
      },
      {
        "home_team": "Team C",
        "away_team": "Team D",
        "match_id": 2,
        "date_time": "date_time"
      },
      {
        "home_team": "Team C",
        "away_team": "Team D",
        "match_id": 2,
        "date_time": "date_time"
      },
      {
        "home_team": "Team C",
        "away_team": "Team D",
        "match_id": 2,
        "date_time": "date_time"
      },
      {
        "home_team": "Team C",
        "away_team": "Team D",
        "match_id": 2,
        "date_time": "date_time"
      },
      {
        "home_team": "Team C",
        "away_team": "Team D",
        "match_id": 2,
        "date_time": "date_time"
      },
      {
        "home_team": "Team C",
        "away_team": "Team D",
        "match_id": 2,
        "date_time": "date_time"
      },
      {
        "home_team": "Team C",
        "away_team": "Team D",
        "match_id": 2,
        "date_time": "date_time"
      },
      {
        "home_team": "Team C",
        "away_team": "Team D",
        "match_id": 2,
        "date_time": "date_time"
      },
      {
        "home_team": "Team E",
        "away_team": "Team F",
        "match_id": 3,
        "date_time": "date_time"
      }
    ]
  };
  List<Match> matches = [];
  Future<void> getMatches() async {
    // final res = await getPrevMatches();
    // setState(() {
    //   for (var match in res) {
    //     matches.add(match);
    //   }
    // });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMatches();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarComponent(context,
            // index: 1,
            title: "Previous Matches"),
        body: Center(
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.4,
            child: ListView(
              children: [
                for (var match in matches)
                  MatchComponent(match.homeTeam?.name, match.awayTeam?.name,
                      match.id, match.date!.split('T')[0], match.time!, context)
              ],
            ),
          ),
        ));
  }
}

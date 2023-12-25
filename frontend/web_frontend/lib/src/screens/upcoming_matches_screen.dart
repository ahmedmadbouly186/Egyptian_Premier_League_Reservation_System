import 'package:flutter/material.dart';
import 'package:web_frontend/src/components/appbar.dart';
import 'package:web_frontend/src/components/match_component.dart';

class UpcomingMatchesScreen extends StatefulWidget {
  @override
  State<UpcomingMatchesScreen> createState() => _UpcomingMatchesScreenState();
}

class _UpcomingMatchesScreenState extends State<UpcomingMatchesScreen> {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarComponent(context,
            // index: 1,
            title: " Upcoming Matches"),
        body: Center(
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.4,
            child: ListView(
              children: [
                for (var match in res["upcomming"]!)
                  MatchComponent(match['home_team'], match['away_team'],
                      match['match_id'], match['date_time'])
              ],
            ),
          ),
        ));
  }
}
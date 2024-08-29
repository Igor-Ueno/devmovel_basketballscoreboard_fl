import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String teamName_1 = 'LAL';
  String teamName_2 = 'BOS';

  int scoreTeam_1 = 0;
  int scoreTeam_2 = 0;

  int lastScoredPoint = 0;

  void _updateScoreboard(int team, int score) {
    setState(() {
      if(team == 1) {
        scoreTeam_1 += score;
        lastScoredPoint = -score;
      }
      if(team == 2) {
        scoreTeam_2 += score;
        lastScoredPoint = score;
      }
    });
  }

  void _resetScoreboard() {
    setState(() {
        scoreTeam_1 = 0;
        scoreTeam_2 = 0;
        lastScoredPoint = 0;
    });
  }

  void _undoLastScoredPoint() {
    print('Last score was: $lastScoredPoint');
    setState(() {
      if(lastScoredPoint < 0) {
        scoreTeam_1 += lastScoredPoint;
        lastScoredPoint = 0;
      }
      else if(lastScoredPoint > 0) {
        scoreTeam_2 -= lastScoredPoint;
        lastScoredPoint = 0;
      }
    });
  }

  bool _checkLastScoredPoint() {
    return (lastScoredPoint != 0) ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Table(
              border: TableBorder.all(),
              children: <TableRow>[
                TableRow(
                  children: [
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.only(top: 4),
                        child:
                        Expanded(
                          child: Image.asset(
                            'assets/images/los_angeles_lakers_icon.png',
                            fit: BoxFit.contain,
                          ),
                          flex: 1,
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.only(left: 5, top: 15, bottom: 15),
                        child: Text(
                          '$teamName_1',
                          style: new TextStyle(
                            fontSize: 25.0,
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.only(left: 5, top: 15, bottom: 15),
                        child: Text(
                          '$scoreTeam_1',
                          style: new TextStyle(
                            fontSize: 25.0,
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.only(right: 5, top: 15, bottom: 15),
                        child: Text(
                          '$scoreTeam_2',
                          style: new TextStyle(
                            fontSize: 25.0,
                          ),
                          textAlign: TextAlign.right),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.only(right: 5, top: 15, bottom: 15),
                        child: Text(
                          '$teamName_2',
                          style: new TextStyle(
                            fontSize: 25.0,
                          ),
                          textAlign: TextAlign.right),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(3),
                        child:Image.asset(
                            'assets/images/boston_celtics_icon.png',
                            fit: BoxFit.contain ,
                          ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 50.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ElevatedButton(
                          onPressed: () => _updateScoreboard(1, 3),
                          child: Text(AppLocalizations.of(context)!.threePointShot + " [+3]"),
                      ),
                      SizedBox(height: 5.0),
                      ElevatedButton(
                          onPressed: () => _updateScoreboard(1, 2),
                        child: Text(AppLocalizations.of(context)!.twoPointShot + " [+2]"),
                      ),
                      SizedBox(height: 5.0),
                      ElevatedButton(
                          onPressed: () => _updateScoreboard(1, 1),
                        child: Text(AppLocalizations.of(context)!.freeThrow + " [+1]"),
                      ),
                    ],
                  ),
                ),
                Expanded(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ElevatedButton(
                          onPressed: () => _updateScoreboard(2, 3),
                          // child: const Text("3 Point Show [+3]"),
                          child: Text(AppLocalizations.of(context)!.threePointShot + " [+3]"),
                      ),
                      SizedBox(height: 5.0),
                      ElevatedButton(
                          onPressed: () => _updateScoreboard(2, 2),
                          child: Text(AppLocalizations.of(context)!.twoPointShot + " [+2]"),
                      ),
                      SizedBox(height: 5.0),
                      ElevatedButton(
                        onPressed: () => _updateScoreboard(2, 1),
                        child: Text(AppLocalizations.of(context)!.freeThrow + " [+1]"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 50.0),
            ElevatedButton(
              onPressed: _checkLastScoredPoint() ? () => _undoLastScoredPoint() : null,
              child: Text(AppLocalizations.of(context)!.undoLastPoints),
            ),
            SizedBox(height: 5.0),
            ElevatedButton(
              onPressed: _resetScoreboard,
              child: Text(AppLocalizations.of(context)!.resetScoreboard),
            ),
          ],
        ),
      ),
    );
  }
}
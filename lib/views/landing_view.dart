import 'package:flutter/material.dart';

import './quest_view.dart';

class LandingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material (
      color: Colors.green[400],
      child: new InkWell(
        onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new QuestView())),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Padding(
                padding: const EdgeInsets.all(20.0),
            ),
            new Text("La Cafeta Lab", style: new TextStyle(color: Colors.white, fontSize: 50.0, fontWeight: FontWeight.bold)),
            new Text("Conoce un poco más a los cafeteros", style: new TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold)),
            new Text("Tap para empezar", style: new TextStyle(color: Colors.white, fontSize: 20.0))
          ]
        )
      )
    );
  }
}
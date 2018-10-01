import 'package:flutter/material.dart';

import './landing_view.dart';

class ResultView extends StatelessWidget {
  final int score;
  final String message;

  ResultView(this.score, this.message);

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.green[400],
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text(message, style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50.0),),
          new Text("Tu puntaje: "+ score.toString()+ "", style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30.0),),
          new IconButton(
            icon: new Icon(Icons.replay),
            color: Colors.white,
            iconSize: 50.0,
            onPressed: () => Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new LandingView()), (Route route) => route == null)
          )
        ],
      )
    );
  }

}
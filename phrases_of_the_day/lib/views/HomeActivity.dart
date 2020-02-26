import 'dart:math';

import 'package:flutter/material.dart';


class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var _phrases = [
    "O amor é algo sério. Não menospreze ou ignore este sentimento",
    "Sentir amor, fazer amor, viver o amor!",
    "O amor dispensa palavras, mas pede por ações",
  ];

  var _currentPhrase = "Click below to generate a phrase!";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Phrases of the day"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset("assets/image/logo.png"),
              Text(
                '${_currentPhrase}',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 25,
                  fontStyle: FontStyle.italic,
                  color: Colors.black
                ),
              ),
              RaisedButton(
                child: Text(
                  "New Phrase",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                ),
                color: Colors.green,
                onPressed: () {

                 _randomPhrases();
                 
                },
              )
            ]
          )
        )
      )
    );
  }

  void _randomPhrases() {
     setState(() {
      _currentPhrase = _phrases[Random().nextInt(_phrases.length)];
    });
  }

}


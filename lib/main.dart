import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _randomNumber = 0;
  int _random = -1;
  bool _repeat = false;

  final List<String> _phrases = [
    "Algumas frases não devem ser verdade...",
    "Nunca jogue de Yummy nas sextas",
    "Talvez esse app seja muito pesado...",
    "É proibido usar Twitch jungle",
    "Você terá um ótimo dia"
  ];

  String _phrase = "Clique abaixo para gerar uma frase:";

  void _generatePhrases() {
    setState(() {
      // para não termos repetições de frases
      do {
        _randomNumber = new Random().nextInt(_phrases.length);
        if(_randomNumber == _random) {
          _repeat = true;
        } else {
          _repeat = false;
          _phrase = _phrases[_randomNumber];
        }
        _random = _randomNumber;
      } while(_repeat);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Frase do dia"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              'images/icon.svg',
              height: 250,
            ),
            Text(
              _phrase,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                color: Colors.black
              ),
            ),
            Padding(
              padding: EdgeInsets.all(0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent, // Define a cor de fundo do botão
                  padding: EdgeInsets.all(16), // Define o padding do botão
                ),
                child: Text(
                  "Nova frase",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                ),
                onPressed: _generatePhrases,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
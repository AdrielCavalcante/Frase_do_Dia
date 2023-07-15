import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Frases do dia',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Frases do dia'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _randomNumber = 0;
  int _random = -1;
  bool _repeat = false;
  List<String> _phrases = [
    "Algumas frases não devem ser verdade...",
    "Nunca jogue de Yummy nas sextas",
    "Talvez esse app seja muito pesado...",
    "É proibido usar Twitch jungle",
    "Você terá um ótimo dia"
  ];

  void _randomPhrases() {
    setState(() {
      // para não termos repetições de frases
      do {
        _randomNumber = new Random().nextInt(5);
        if(_randomNumber == _random) {
          _repeat = true;
        } else {
          _repeat = false;
        }
        _random = _randomNumber;
      } while(_repeat);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Pressione o botão para gerar uma frase:\n',
            ),
            Text(
              _phrases[_randomNumber],
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _randomPhrases,
        tooltip: 'add a phrase',
        child: const Icon(Icons.pending_outlined),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

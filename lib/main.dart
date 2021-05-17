import 'package:flutter/material.dart';
import 'package:statbuzz/services/player_repository.dart';

import './screens/home_page.dart';

void main() {
  PlayerRepository _repository = PlayerRepository();

  runApp(MyApp(
    playerRepository: _repository,
  ));
}

class MyApp extends StatelessWidget {
  final PlayerRepository playerRepository;

  MyApp({this.playerRepository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StatBuzz',
      home: HomePage(playerRepository: playerRepository),
    );
  }
}

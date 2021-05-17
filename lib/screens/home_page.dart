import 'package:flutter/material.dart';
import 'package:statbuzz/services/player_repository.dart';
import 'package:statbuzz/themes/themes.dart';
import 'package:statbuzz/widgets/horizontal_bar.dart';

class HomePage extends StatelessWidget {
  final PlayerRepository playerRepository;

  HomePage({this.playerRepository});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'Football Players',
            style: appBarTextStyle,
            //textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Column(
        children: [
          HorizontalBar(),
          SizedBox(height: 10.0),
          //PlayerListing(),
        ],
      ),
    );
  }
}

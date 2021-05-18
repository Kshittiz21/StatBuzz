import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statbuzz/bloc/player_listing_bloc.dart';
import 'package:statbuzz/screens/advanced_search_page.dart';
import 'package:statbuzz/screens/player_listing.dart';
import 'package:statbuzz/services/player_repository.dart';
import 'package:statbuzz/themes/themes.dart';
import 'package:statbuzz/widgets/horizontal_bar.dart';
import 'package:statbuzz/widgets/search_bar.dart';

class HomePage extends StatefulWidget {
  final PlayerRepository playerRepository;

  HomePage({this.playerRepository});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PlayerListingBloc _playerListingBloc;

  @override
  void initState() {
    super.initState();
    _playerListingBloc =
        PlayerListingBloc(playerRepository: widget.playerRepository);
  }

  @override
  void didUpdateWidget(covariant HomePage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _playerListingBloc,
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AdvancedSearchPage()),
            );
          },
          label: Text('Advanced Search'),
          icon: Icon(Icons.filter_list),
        ),
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
            SearchBar(),
            SizedBox(height: 10.0),
            PlayerListing(),
          ],
        ),
      ),
    );
  }
}

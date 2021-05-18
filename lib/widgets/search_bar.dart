import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statbuzz/bloc/player_listing_bloc.dart';
import 'package:statbuzz/bloc/player_listing_event.dart';
import '../themes/themes.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: TextField(
        onChanged: (term) {
          print(term);
          BlocProvider.of<PlayerListingBloc>(context).add(
            SearchTextChangedEvent(searchTerm: term),
          );
        },
        style: searchStyle,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 12,
          ),
          hintStyle: hintStyle,
          hintText: 'Search For a Player',
          prefixIcon: Icon(
            Icons.person,
            size: 30.0,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

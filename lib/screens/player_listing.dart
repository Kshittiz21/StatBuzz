import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statbuzz/bloc/player_listing_bloc.dart';
import 'package:statbuzz/bloc/player_listing_state.dart';
import 'package:statbuzz/models/api_models.dart';
import 'package:statbuzz/widgets/message.dart';
import '../themes/themes.dart';

class PlayerListing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: BlocProvider.of<PlayerListingBloc>(context),
      builder: (context, state) {
        if (state is PlayerUninitializedState) {
          return Message(
              message: "Please select a country flag to fetch players from");
        } else if (state is PlayerEmptyState) {
          return Message(message: "No Players Found");
        } else if (state is PlayerErrorState) {
          return Message(message: "Something Went Wrong");
        } else if (state is PlayerFetchingState) {
          return Expanded(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          final stateAsPlayersFetchedState = state as PlayerFetchedState;
          final players = stateAsPlayersFetchedState.players;
          return buildPlayersList(players);
        }
      },
    );
  }

  Widget buildPlayersList(List<Players> players) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (BuildContext context, index) {
          Players player = players[index];
          return ListTile(
            leading: Image.network(
              //player.headshot.imgUrl,
              "https://thumbor.forbes.com/thumbor/fit-in/416x416/filters%3Aformat%28jpg%29/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F5ec595d45f39760007b05c07%2F0x0.jpg%3Fbackground%3D000000%26cropX1%3D989%26cropX2%3D2480%26cropY1%3D74%26cropY2%3D1564",
              //'https://english.cdn.zeenews.com/sites/default/files/2020/05/16/861245-807322-805435-football.jpg',
              width: 70,
              height: 70,
            ),
            title: Text(player.name, style: titleStyle),
            subtitle: Text(player.club.name, style: subtitleStyle),
          );
        },
        separatorBuilder: (BuildContext context, index) {
          return Divider(
            height: 8.0,
            color: Colors.transparent,
          );
        },
        itemCount: players.length,
      ),
    );
  }
}

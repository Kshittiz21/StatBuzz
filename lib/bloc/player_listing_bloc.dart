import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statbuzz/bloc/player_listing_event.dart';
import 'package:statbuzz/bloc/player_listing_state.dart';
import 'package:statbuzz/models/api_models.dart';
import 'package:statbuzz/services/player_repository.dart';

class PlayerListingBloc extends Bloc<PlayerListingEvent, PlayerListingState> {
  final PlayerRepository playerRepository;

  PlayerListingBloc({this.playerRepository})
      : assert(playerRepository != null),
        super(PlayerUninitializedState());

  @override
  Stream<PlayerListingState> mapEventToState(PlayerListingEvent event) async* {
    if (event is CountrySelectedEvent) {
      yield PlayerFetchingState();
      try {
        final List<Players> players =
            await playerRepository.fetchPlayersByCountry(
                event.nationModel.countryId);
        if (players.length == 0) {
          yield PlayerEmptyState();
        } else {
          yield PlayerFetchedState(players: players);
        }
      } catch (_) {
        yield PlayerErrorState(); 
      }
    }
  }
}

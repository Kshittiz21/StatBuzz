import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statbuzz/bloc/player_listing_event.dart';
import 'package:statbuzz/bloc/player_listing_state.dart';
import 'package:statbuzz/models/api_models.dart';
import 'package:statbuzz/services/player_repository.dart';
import 'package:rxdart/rxdart.dart';

class PlayerListingBloc extends Bloc<PlayerListingEvent, PlayerListingState> {
  final PlayerRepository playerRepository;

  PlayerListingBloc({this.playerRepository})
      : assert(playerRepository != null),
        super(PlayerUninitializedState());

  @override
  Stream<Transition<PlayerListingEvent, PlayerListingState>> transformEvents(
      Stream<PlayerListingEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 2000)), transitionFn);
  }

  @override
  Stream<PlayerListingState> mapEventToState(PlayerListingEvent event) async* {
    print("mapEventToState");
    yield PlayerFetchingState();
    try {
      List<Players> players = [];
      if (event is CountrySelectedEvent) {
        players = await playerRepository
            .fetchPlayersByCountry(event.nationModel.countryId);
      } else if (event is SearchTextChangedEvent) {
        print("Hitting Service");
        players = await playerRepository.fetchPlayersByName(event.searchTerm);
      }
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

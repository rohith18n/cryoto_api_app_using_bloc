import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/data_sources/home_watchlist_list.dart';
import '../../../domain/models/crypto_model.dart';
part 'watchlist_event.dart';
part 'watchlist_state.dart';

class WatchlistBloc extends Bloc<WatchlistEvent, WatchlistState> {
  WatchlistBloc() : super(WatchlistInitialState()) {
    on<WatchListInitialEvent>(watchlistInitialState);
    on<WatchListAddEvent>(watchListAddEvent);
    on<WatchListRemoveEvent>(watchListRemoveEvent);
  }

  FutureOr<void> watchlistInitialState(
      WatchlistEvent event, Emitter<WatchlistState> emit) {
    emit(WatchlistSuccessState(watchList: watchList));
  }

  FutureOr<void> watchListAddEvent(
      WatchListAddEvent event, Emitter<WatchlistState> emit) {
    emit(WatchlistSuccessState(watchList: event.watchList));
  }

  FutureOr<void> watchListRemoveEvent(
      WatchListRemoveEvent event, Emitter<WatchlistState> emit) {
    event.watchList.remove(event.coin);
    emit(WatchlistSuccessState(watchList: event.watchList));
  }
}

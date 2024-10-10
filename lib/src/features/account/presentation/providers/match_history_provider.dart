import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/database_cache.dart';
import '../../doman/usecases/i_cache_facade.dart';
import '../../doman/usecases/match_history_screen_event.dart';
import '../../doman/usecases/match_history_screen_state.dart';

final matchHistoryProvider =
    StateNotifierProvider<MatchHistoyServices, MatchHistoryScreenState>((ref) =>
        MatchHistoyServices(cacheFacade: ref.read(databaseCacheProvider)));

class MatchHistoyServices extends StateNotifier<MatchHistoryScreenState> {
  MatchHistoyServices({required this.cacheFacade})
      : super(MatchHistoryScreenState(history: []));
  final ICacheFacade cacheFacade;

  Future<void> addEvent(MatchHistoryScreenEvent event) async {
    await event.map(expandMatch: (ExpandMatch selected) async {});
  }
}

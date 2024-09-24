import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../game_scoring/domain/entities/darts_match.dart';

part 'match_history_screen_event.freezed.dart';

@freezed
class MatchHistoryScreenEvent with _$MatchHistoryScreenEvent {
  const factory MatchHistoryScreenEvent.expandMatch(DartsMatch match) =
      ExpandMatch;
}

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../account/doman/entities/app_user.dart';

part 'selection_screen_event.freezed.dart';

@freezed
class SelectionScreenEvent with _$SelectionScreenEvent {
  const factory SelectionScreenEvent.playX01() = PlayX01;
  const factory SelectionScreenEvent.playCricket() = PlayCricket;
  const factory SelectionScreenEvent.playClock() = PlayClock;
  const factory SelectionScreenEvent.playBobs() = PlayBobs;
  const factory SelectionScreenEvent.updateStartingScore(int startingScore) =
      UpdateStartingScore;
  const factory SelectionScreenEvent.updateFirstTo(int selected) =
      updateFirstTo;
  const factory SelectionScreenEvent.updatePlaySets(bool selected) =
      UpdatePlaySets;
  const factory SelectionScreenEvent.addPlayerSelected() = AddPlayerSelected;
  const factory SelectionScreenEvent.addPlayer(Player player) = AddPlayer;
  const factory SelectionScreenEvent.reorderPlayers(
      {required int oldIndex, required int newIndex}) = ReorderPlayers;
  const factory SelectionScreenEvent.removePlayer(int selected) = RemovePlayer;
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_player_event.freezed.dart';

@freezed
class AddPlayerEvent with _$AddPlayerEvent {
  const factory AddPlayerEvent.selectedAddPlayer() = SelectedAddPlayer;
  const factory AddPlayerEvent.userInputting(String displayName) =
      UserInputting;
  // const factory AddPlayerEvent.changedAvatarColor(Color avatarColor) =
  //     ChangedAvatarColor;
  const factory AddPlayerEvent.inputtingComplete() = InputtingComplete;
  const factory AddPlayerEvent.addPlayerCancelled() = AddPlayerCancelled;
  // const factory AddPlayerEvent.selectedPlayerFromList(AppUser player) =
  //     SelectedPlayerFromList;
}

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/validators.dart';
import '../../../account/doman/entities/app_user.dart';

class AddPlayerScreenState {
  AddPlayerScreenState({
    required this.selectedPlayer,
    required this.isLoading,
    required this.errorMessage,
    required this.showErrorMessages,
    // required this.listOfAvailableFriends,
  });
  final Player selectedPlayer;
  final bool isLoading;
  final String errorMessage;
  final bool showErrorMessages;
  // final List<AppUser> listOfAvailableFriends;

  AddPlayerScreenState.initial(Ref ref)
      : selectedPlayer = Player.createAppUserWithRandomId(ref: ref, name: ''),
        isLoading = false,
        errorMessage = '',
        showErrorMessages = false;
  // listOfAvailableFriends = [];

  AddPlayerScreenState inputDisplayName(String displayName) {
    var errorMessage = displayNameValidationError(displayName);
    return _copyWith(
      newSelectedPlayer:
          Player(playerId: selectedPlayer.playerId, displayName: displayName),
      newErrorMessage: errorMessage,
    );
  }

  // AddPlayerScreenState changeAvatarColor(Color avatarColor) {
  //   return _copyWith(
  //       newSelectedPlayer: AppUser(
  //           id: selectedPlayer.id, displayName: selectedPlayer.displayName));
  // }

  AddPlayerScreenState? inputtingComplete() {
    final displayNameErrorMessage =
        displayNameValidationError(selectedPlayer.displayName);
    if (displayNameErrorMessage.isEmpty) return null;
    return _copyWith(
      newShowErrorMessages: true,
      newErrorMessage: displayNameErrorMessage,
      newIsLoading: false,
    );
  }

  // AddPlayerScreenState updateListOfAvailableFriends(
  //     {required List<AppUser> friends, required List<AppUser> players}) {
  //   List<AppUser> tempFriends = [];
  //   for (var friend in friends) {
  //     if (players.any((AppUser player) => player.id == friend.id)) continue;
  //     tempFriends.add(friend);
  //   }
  //   return _copyWith(newListOfAvailableFriends: tempFriends);
  // }

  AddPlayerScreenState _copyWith({
    Player? newSelectedPlayer,
    bool? newIsLoading,
    String? newErrorMessage,
    bool? newShowErrorMessages,
    // List<AppUser>? newListOfAvailableFriends,
  }) =>
      AddPlayerScreenState(
        selectedPlayer: newSelectedPlayer ?? selectedPlayer,
        isLoading: newIsLoading ?? isLoading,
        errorMessage: newErrorMessage ?? errorMessage,
        showErrorMessages: newShowErrorMessages ?? showErrorMessages,
        // listOfAvailableFriends:
        //     newListOfAvailableFriends ?? listOfAvailableFriends);
      );
}

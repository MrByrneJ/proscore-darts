import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proscore_darts/src/features/game_selection/domain/usecases/selection_screen_event.dart';
import 'package:proscore_darts/src/features/game_selection/presentation/providers/game_selection_provider.dart';
import 'package:proscore_darts/src/features/game_selection/presentation/screens/add_player_screen.dart';

import '../../../../router/router.dart';
import '../../domain/usecases/add_player_event.dart';
import '../../domain/usecases/add_player_screen_state.dart';

final addPlayerProvider =
    StateNotifierProvider<AddPlayerServices, AddPlayerScreenState>(
        (ref) => AddPlayerServices(ref));

class AddPlayerServices extends StateNotifier<AddPlayerScreenState> {
  AddPlayerServices(this.ref) : super(AddPlayerScreenState.initial(ref));

  final Ref ref;

  void addEvent(AddPlayerEvent event) {
    event.map(
      selectedAddPlayer: (_) {
        router.push(AddPlayerScreen.path);
      },
      userInputting: (UserInputting input) {
        state = state.inputDisplayName(input.displayName);
      },
      // changedAvatarColor: (ChangedAvatarColor selected) =>
      //     state = state.changeAvatarColor(selected.avatarColor),
      inputtingComplete: (_) {
        var newState = state.inputtingComplete();
        if (newState == null) {
          ref.read(selectionScreenProvider.notifier).handleEvent(
              SelectionScreenEvent.addPlayer(state.selectedPlayer));
          state = AddPlayerScreenState.initial(ref);
          router.pop();
        } else {
          state = newState;
        }
      },
      addPlayerCancelled: (_) {
        state = AddPlayerScreenState.initial(ref);
        router.pop();
      },
      // selectedNewInputCatagory: (SelectedNewInputCatagory selected) =>
      //     state = state.selectNewCategory(selected.category),
      //
    );
  }
}

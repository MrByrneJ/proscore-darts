import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../router/router.dart';
import '../../../account/doman/usecases/user_services_event.dart';
import '../../../account/presentation/providers/app_user_provider.dart';
import '../../../game_selection/presentation/screens/game_selection_screen.dart';
import '../../domain/usecases/welcome_screen_event.dart';
import '../../domain/usecases/welcome_screen_state.dart';

final welcomeScreenProvider =
    StateNotifierProvider<WelcomeScreenServices, WelcomeScreenState>(
        (ref) => WelcomeScreenServices(ref));

class WelcomeScreenServices extends StateNotifier<WelcomeScreenState> {
  WelcomeScreenServices(this.ref) : super(WelcomeScreenState.initial());

  final Ref ref;

  void addEvent(WelcomeScreenEvent event) {
    event.map(userInputting: (event) async {
      state = state.inputDisplayName(event.displayName);
    }, inputtingComplete: (_) async {
      state = state.copyWith(newIsLoading: true);
      var newState = state.inputtingComplete();
      if (newState == null) {
        await ref
            .read(appUserProvider.notifier)
            .handleEvent(UserServicesEvent.createBasicUser(state.displayName));
        state = WelcomeScreenState.initial();
        router.pushReplacement(GameSelectionScreen.path);
        return;
      }
      state = newState;
    });
  }
}

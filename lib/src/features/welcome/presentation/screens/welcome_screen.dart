import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proscore_darts/src/features/game_selection/presentation/screens/game_selection_screen.dart';

import '../../../../core/constant_variables.dart';
import '../../../../core/widgets/display_name_input_field.dart';
import '../../../../core/widgets/image_background_scaffold.dart';
import '../../../../router/router.dart';
import '../../../account/presentation/providers/app_user_provider.dart';
import '../../domain/usecases/welcome_screen_event.dart';
import '../providers/welcome_screen_provider.dart';

class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({super.key});

  static const path = '/welcome';

  void submit(BuildContext context, WidgetRef ref) {
    ref
        .read(welcomeScreenProvider.notifier)
        .addEvent(const WelcomeScreenEvent.inputtingComplete());
    final user = ref.read(appUserProvider);
    if (user != null && user.id.isNotEmpty) {
      FocusScope.of(context).unfocus();
      router.go(GameSelectionScreen.path);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(welcomeScreenProvider);
    return ImageBackgroundScaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    'Enter a display name',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
              const SizedBox(height: 10),
              SizedBox(
                  height: 50,
                  child: DisplayNameInputField(
                    onChanged: (value) => ref
                        .read(welcomeScreenProvider.notifier)
                        .addEvent(WelcomeScreenEvent.userInputting(value)),
                    onSubmitted: (_) => submit(context, ref),
                  )),
              if (state.showErrorMessages && state.errorMessage.isNotEmpty)
                const SizedBox(height: 4),
              if (state.showErrorMessages && state.errorMessage.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(state.errorMessage,
                      style: const TextStyle(fontSize: 12, color: Colors.red)),
                ),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () => submit(context, ref),
                  child: const Text('Submit'))
            ]),
      ),
    );
  }
}

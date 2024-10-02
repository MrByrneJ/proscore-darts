import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proscore_darts/src/core/constant_variables.dart';

import '../../../../app.dart';
import '../../../../core/widgets/image_background_scaffold.dart';
import '../../../../router/router.dart';
import '../../../account/doman/entities/app_user.dart';
import '../../../account/doman/usecases/user_services_event.dart';
import '../../../account/presentation/providers/app_user_provider.dart';
import '../../../account/presentation/screens/match_history_screen.dart';
import '../../domain/usecases/selection_screen_event.dart';
import '../providers/game_selection_provider.dart';

class GameSelectionScreen extends ConsumerWidget {
  const GameSelectionScreen({super.key});

  static const path = '/game-selection';

  void signOut(
      {required BuildContext context, required WidgetRef ref, AppUser? user}) {
    ref
        .read(appUserProvider.notifier)
        .handleEvent(const UserServicesEvent.clearData());
    Navigator.of(context).pop();
    router.go(SplashScreen.path);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(appUserProvider);
    return ImageBackgroundScaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(height: 200, color: Colors.green),
            TextButton.icon(
              onPressed: () {
                Navigator.of(context).pop();
                router.push(MatchHistoryScreen.path);
              },
              label: const Text('History'),
              icon: const Icon(Icons.list),
            ),
            const SizedBox(height: 10),
            TextButton.icon(
              onPressed: () => signOut(context: context, ref: ref, user: user),
              label: const Text('Logout'),
              icon: const Icon(Icons.logout),
            )
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // SizedBox(
          //   width: 50,
          //   height: 50,
          //   child: Center(
          //     child: ElevatedButton(
          //         onPressed: () => signOut(context, ref),
          //         child: const Icon(Icons.logout)),
          //   ),
          // ),
          const Expanded(child: SizedBox()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  const SizedBox(width: 10),
                  Text(
                    'Welcome ${user!.displayName}',
                    style: const TextStyle(fontSize: 20, color: primaryWhite),
                  )
                ]),
                const SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () => ref
                        .read(selectionScreenProvider.notifier)
                        .handleEvent(const SelectionScreenEvent.playX01()),
                    child: const Text('X01')),
                const SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () => ref
                        .read(selectionScreenProvider.notifier)
                        .handleEvent(const SelectionScreenEvent.playCricket()),
                    child: const Text('Cricket')),
                const SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () => ref
                        .read(selectionScreenProvider.notifier)
                        .handleEvent(const SelectionScreenEvent.playClock()),
                    child: const Text('Around the clock')),
                const SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () => ref
                        .read(selectionScreenProvider.notifier)
                        .handleEvent(const SelectionScreenEvent.playBobs()),
                    child: const Text('Bobs 27\'s')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

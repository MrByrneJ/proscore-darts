import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proscore_darts/src/core/widgets/display_name_input_field.dart';

import '../../../../core/constant_variables.dart';
import '../../domain/usecases/add_player_event.dart';
import '../providers/add_player_provider.dart';

class CreateUserContentCard extends ConsumerWidget {
  const CreateUserContentCard({super.key});

  void submitForm(BuildContext context, WidgetRef ref) {
    if (ref.read(addPlayerProvider).errorMessage.isEmpty) {
      FocusScope.of(context).unfocus();
    }
    ref
        .read(addPlayerProvider.notifier)
        .addEvent(const AddPlayerEvent.inputtingComplete());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addPlayerProvider);
    // final player = state.selectedPlayer;
    // final avatarColors =
    //     ref.read(avatarColorProvider.notifier).availableAvatarColors();
    // final currentIndex =
    //     avatarColors.indexWhere((element) => element == player.avatarColor);
    // final leftArrowColorIndex =
    //     currentIndex - 1 == -1 ? avatarColors.length - 1 : currentIndex - 1;
    // final rightArrowColorIndex =
    //     currentIndex == avatarColors.length - 1 ? 0 : currentIndex + 1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     ArrowBox(
        //         whenTapped: () => ref.read(addPlayerProvider.notifier).addEvent(
        //             AddPlayerEvent.changedAvatarColor(
        //                 avatarColors[leftArrowColorIndex])),
        //         color: avatarColors[leftArrowColorIndex],
        //         icon: Icons.arrow_left_rounded),
        //     PlayerAvatar(key: ValueKey(player.id), player: player),
        //     ArrowBox(
        //         whenTapped: () => ref.read(addPlayerProvider.notifier).addEvent(
        //             AddPlayerEvent.changedAvatarColor(
        //                 avatarColors[rightArrowColorIndex])),
        //         color: avatarColors[rightArrowColorIndex],
        //         icon: Icons.arrow_right_rounded),
        //   ],
        // ),
        const SizedBox(height: 10),
        DisplayNameInputField(
          key: const ValueKey('playerName'),
          onChanged: (input) => ref
              .read(addPlayerProvider.notifier)
              .addEvent(AddPlayerEvent.userInputting(input)),
          onSubmitted: (value) => submitForm(context, ref),
          inputAction: TextInputAction.done,
        ),
        if (state.showErrorMessages && state.errorMessage.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              state.errorMessage,
              style: const TextStyle(fontSize: 12, color: primaryWhite),
            ),
          ),
        const SizedBox(height: 10),
        ElevatedButton(
            onPressed: () => submitForm(context, ref),
            child: const Text('Add player')),
        const SizedBox(height: 10),
      ],
    );
  }
}

class ArrowBox extends StatelessWidget {
  const ArrowBox(
      {super.key,
      required this.whenTapped,
      required this.color,
      required this.icon});
  final VoidCallback whenTapped;
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: whenTapped,
      child: Card(
        color: color,
        margin: const EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: SizedBox(
          width: 40,
          height: 40,
          child: Center(
            child: FittedBox(
                child: Icon(
              icon,
              size: 80,
              color: primaryBlack,
            )),
          ),
        ),
      ),
    );
  }
}

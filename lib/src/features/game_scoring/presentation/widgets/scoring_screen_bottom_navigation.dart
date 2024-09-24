import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constant_variables.dart';
import '../../../../core/enums.dart';
import '../../domain/usecases/scoring_screen_event.dart';
import '../providers/scoring_screen_provider.dart';
import './navigation_button.dart';

class ScoringScreenBottomNavigation extends ConsumerWidget {
  const ScoringScreenBottomNavigation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(scoringScreenProvider);
    final history = ref.watch(scoringScreenProvider.notifier).gameProgress;
    final index = ref.watch(scoringScreenProvider.notifier).currentIndex;

    return Container(
      color: darkShadowColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: NavigationButton(
              whenTapped: () => ref.read(scoringScreenProvider.notifier).undo(),
              icon: Icons.undo,
              isActive: index > 0,
            ),
          ),
          Flexible(
            flex: 3,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (state.availableInputs.contains(ScoringInputMethod.keypad))
                  Flexible(
                    child: NavigationButton(
                        whenTapped: () => ref
                            .read(scoringScreenProvider.notifier)
                            .handleEvent(
                                const ScoringScreenEvent.selectInputMethod(
                                    ScoringInputMethod.keypad)),
                        icon: Icons.grid_view_rounded,
                        isSelected:
                            state.selectedInput == ScoringInputMethod.keypad),
                  ),
                if (state.availableInputs.contains(ScoringInputMethod.board))
                  Flexible(
                    child: NavigationButton(
                        whenTapped: () => ref
                            .read(scoringScreenProvider.notifier)
                            .handleEvent(
                                const ScoringScreenEvent.selectInputMethod(
                                    ScoringInputMethod.board)),
                        icon: Icons.adjust,
                        isSelected:
                            state.selectedInput == ScoringInputMethod.board),
                  ),
                if (state.availableInputs.contains(ScoringInputMethod.field))
                  Flexible(
                    child: NavigationButton(
                        whenTapped: () => ref
                            .read(scoringScreenProvider.notifier)
                            .handleEvent(
                                const ScoringScreenEvent.selectInputMethod(
                                    ScoringInputMethod.field)),
                        icon: Icons.grid_on,
                        isSelected:
                            state.selectedInput == ScoringInputMethod.field),
                  ),
                if (state.availableInputs.contains(ScoringInputMethod.simple))
                  Flexible(
                    child: NavigationButton(
                        whenTapped: () => ref
                            .read(scoringScreenProvider.notifier)
                            .handleEvent(
                                const ScoringScreenEvent.selectInputMethod(
                                    ScoringInputMethod.simple)),
                        icon: Icons.linear_scale,
                        isSelected:
                            state.selectedInput == ScoringInputMethod.simple),
                  ),
                if (state.availableInputs.contains(ScoringInputMethod.cricket))
                  Flexible(
                      child: NavigationButton(
                          whenTapped: () => ref
                              .read(scoringScreenProvider.notifier)
                              .handleEvent(
                                  const ScoringScreenEvent.selectInputMethod(
                                      ScoringInputMethod.cricket)),
                          icon: Icons.add_box_outlined,
                          isSelected: state.selectedInput ==
                              ScoringInputMethod.cricket)),
              ],
            ),
          ),
          Flexible(
            child: NavigationButton(
              whenTapped: () => ref.read(scoringScreenProvider.notifier).redo(),
              icon: Icons.redo,
              isActive: index < history.length - 1,
            ),
          ),
        ],
      ),
    );
  }
}

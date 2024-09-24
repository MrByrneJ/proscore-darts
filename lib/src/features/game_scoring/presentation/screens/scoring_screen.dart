import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/image_background_scaffold.dart';
import '../../domain/entities/cricket.dart';
import '../providers/scoring_screen_provider.dart';
import '../widgets/cricketboard.dart';
import '../widgets/end_of_leg_dialog.dart';
import '../widgets/scoring_inputs.dart';
import '../widgets/scoring_screen_bottom_navigation.dart';
import '../widgets/shot_info_banner.dart';
import '../widgets/chalkboard.dart';

class ScoringScreen extends ConsumerWidget {
  const ScoringScreen({super.key});

  static const path = '/scoring';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(scoringScreenProvider);

    return ImageBackgroundScaffold(
      child: state.showEndOfLegDialog
          ? const EndOfLegDialog()
          : SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  if (state.dartsMatch is! Cricket)
                    const Expanded(child: Chalkboard()),
                  if (state.dartsMatch is Cricket)
                    const Expanded(child: Cricketboard()),
                  if (state.dartsMatch is! Cricket)
                    ShotInfoBanner(state: state),
                  ScoringInputs(
                      state: state,
                      size: Size(MediaQuery.of(context).size.width,
                          MediaQuery.of(context).size.width),
                      ref: ref),
                  const SizedBox(height: 5),
                  const ScoringScreenBottomNavigation(),
                ],
              ),
            ),
    );
  }
}

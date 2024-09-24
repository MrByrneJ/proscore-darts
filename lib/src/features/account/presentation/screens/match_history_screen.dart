import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constant_variables.dart';
import '../../../../core/widgets/image_background_scaffold.dart';
import '../../../game_scoring/domain/entities/darts_match.dart';
import '../providers/app_user_provider.dart';
import '../widgets/history_tile.dart';

class MatchHistoryScreen extends ConsumerWidget {
  const MatchHistoryScreen({super.key});

  static const path = '/match-history';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(appUserProvider);
    return ImageBackgroundScaffold(
        appBar: AppBar(
          title: const Text('Match History'),
        ),
        child: Column(
          children: [
            if (state == null || state.history.isEmpty)
              const Text('Nothing to show',
                  style: TextStyle(fontSize: 16, color: primaryWhite)),
            for (final DartsMatch match in state?.history ?? [])
              HistoryTile(match: match)
          ],
        ));
  }
}

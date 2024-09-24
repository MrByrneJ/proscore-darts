import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/content_card.dart';
import '../../domain/usecases/add_player_event.dart';
import '../providers/add_player_provider.dart';

class SearchForUserContentCard extends ConsumerWidget {
  const SearchForUserContentCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addPlayerProvider);
    return ContentCard(
      headline: 'Search People',
      children: [
        TextField(
          key: const ValueKey('playerName'),
          onChanged: (input) => ref
              .read(addPlayerProvider.notifier)
              .addEvent(AddPlayerEvent.userInputting(input)),
          textInputAction: TextInputAction.done,
          decoration: const InputDecoration(
              prefixIcon: Icon(Icons.account_circle),
              hintText: 'Display Name or Nickname?'),
          style: Theme.of(context).textTheme.labelSmall,
        ),
        if (state.showErrorMessages && state.errorMessage.isNotEmpty)
          Text(state.errorMessage),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Search'),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

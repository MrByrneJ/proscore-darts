// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../../../core/constant_variables.dart';
// import '../../../account/doman/usecases/app_user.dart';
// import '../../domain/add_player_event.dart';
// import '../providers/add_player_provider.dart';
// import 'player_stats_card.dart';

// class AddFriendContentCard extends ConsumerWidget {
//   const AddFriendContentCard({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final state = ref.watch(addPlayerProvider);
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         for (AppUser friend in state.listOfAvailableFriends)
//           PlayerStatsCard(
//               user: friend,
//               actionIcon:
//                   const Icon(Icons.add_circle_outline, color: primaryGreen),
//               whenActionTapped: () => ref
//                   .read(addPlayerProvider.notifier)
//                   .addEvent(AddPlayerEvent.selectedPlayerFromList(friend))),
//       ],
//     );
//   }
// }

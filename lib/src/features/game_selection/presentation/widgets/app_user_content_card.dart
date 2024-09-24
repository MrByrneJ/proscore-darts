// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../../../core/avatar_colors.dart';
// import '../../../../core/constant_variables.dart';
// import '../../../../core/widgets/content_card.dart';
// import '../../../account/doman/usecases/app_user.dart';
// import '../../../account/presentation/presentation/providers/app_user_provider.dart';
// import '../../domain/add_player_event.dart';
// import '../providers/add_player_provider.dart';
// import 'player_avatar.dart';

// class AppUserContentCard extends ConsumerWidget {
//   const AppUserContentCard({super.key});

//   void submitForm(BuildContext context, WidgetRef ref, AppUser player) => ref
//       .read(addPlayerProvider.notifier)
//       .addEvent(AddPlayerEvent.selectedPlayerFromList(player));

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final player = ref.read(appUserProvider) ??
//         AppUser(
//             id: 'Error', displayName: 'Error', avatarColor: randomAvatarColor);

//     return ContentCard(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             PlayerAvatar(
//               key: ValueKey(player.id),
//               player: player,
//               onTapped: () => submitForm(context, ref, player),
//               actionIcon: const Icon(
//                 Icons.add_circle_outline_rounded,
//                 color: primaryGreen,
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(height: 10),
//       ],
//     );
//   }
// }

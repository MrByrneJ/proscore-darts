// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:proscore_darts/src/features/game_selection/presentation/providers/game_selection_provider.dart';

// final avatarColorProvider = StateNotifierProvider<AvatarColorServices, void>(
//     (ref) => AvatarColorServices(ref));

// class AvatarColorServices extends StateNotifier<void> {
//   AvatarColorServices(this.ref) : super(null);

//   final Ref ref;

//   final avatarColors = const [
//     Color.fromARGB(255, 239, 148, 142),
//     Color.fromARGB(255, 191, 248, 158),
//     Color.fromARGB(255, 158, 239, 248),
//     Color.fromARGB(255, 172, 158, 248),
//     Color.fromARGB(255, 248, 158, 235),
//     Color.fromARGB(255, 236, 248, 158),
//     Color.fromARGB(255, 248, 194, 158),
//   ];

//   List<Color> availableAvatarColors() {
//     var colors = [...avatarColors];
//     for (var p in ref.read(selectionScreenProvider).players) {
//       print(p.id);
//       colors.removeWhere((e) => e == p.avatarColor);
//     }
//     return colors;
//   }

//   Color get randomAvatarColor =>
//       availableAvatarColors()[Random().nextInt(avatarColors.length)];
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proscore_darts/src/core/widgets/image_background_scaffold.dart';

import '../widgets/create_user_content_card.dart';
import '../widgets/game_setup_bar.dart';

class AddPlayerScreen extends ConsumerWidget {
  const AddPlayerScreen({super.key});
  static const path = '/add-player';

  // Widget getCurrentCard(
  //     InputCategory category, List<AppUser> availableFriends) {
  //   switch (category) {
  //     case InputCategory.user:
  //       return const AppUserContentCard();
  //     case InputCategory.guest:
  //       return const CreateUserContentCard();
  //     case InputCategory.friend:
  //       return const AddFriendContentCard();
  //     case InputCategory.search:
  //       return const SearchForUserContentCard();
  //   }
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final state = ref.watch(addPlayerProvider);
    // final playersListContainsUser = ref
    //     .read(scoringScreenProvider)
    //     .dartsMatch
    //     .players
    //     .any((element) => element.id == ref.read(appUserProvider)?.id);
    return const ImageBackgroundScaffold(
      child: CustomScrollView(
        scrollDirection: Axis.vertical,
        reverse: true,
        slivers: [
          SliverToBoxAdapter(
            child: GameSetupBar(
              key: ValueKey('addPlayerSetUpBar'),
              backLable: 'Player Settings',
            ),
          ),
          SliverToBoxAdapter(
              child:
                  //           getCurrentCard(state.category, state.listOfAvailableFriends)),
                  Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                      child: CreateUserContentCard())),
          // SliverToBoxAdapter(
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(
          //       horizontal: 10,
          //     ),
          //     child: Row(
          //       children: [
          //         if (!playersListContainsUser)
          //           CatagoryBox(
          //             whenTapped: () => ref
          //                 .read(addPlayerProvider.notifier)
          //                 .addEvent(
          //                     const AddPlayerEvent.selectedNewInputCatagory(
          //                         InputCategory.user)),
          //             lable: ref.read(appUserProvider)?.displayName ?? '',
          //             isSelected: state.category == InputCategory.user,
          //           ),
          //         if (!playersListContainsUser) const SizedBox(width: 10.0),
          //         CatagoryBox(
          //           whenTapped: () => ref
          //               .read(addPlayerProvider.notifier)
          //               .addEvent(const AddPlayerEvent.selectedNewInputCatagory(
          //                   InputCategory.guest)),
          //           lable: 'Guest',
          //           isSelected: state.category == InputCategory.guest,
          //         ),
          //         const SizedBox(width: 10.0),
          //         if (state.listOfAvailableFriends.isNotEmpty)
          //           CatagoryBox(
          //             whenTapped: () => ref
          //                 .read(addPlayerProvider.notifier)
          //                 .addEvent(
          //                     const AddPlayerEvent.selectedNewInputCatagory(
          //                         InputCategory.friend)),
          //             lable: 'Friend',
          //             isSelected: state.category == InputCategory.friend,
          //           ),
          //         if (state.listOfAvailableFriends.isNotEmpty)
          //           const SizedBox(width: 10.0),
          //         CatagoryBox(
          //           whenTapped: () => ref
          //               .read(addPlayerProvider.notifier)
          //               .addEvent(const AddPlayerEvent.selectedNewInputCatagory(
          //                   InputCategory.search)),
          //           lable: 'Search',
          //           isSelected: state.category == InputCategory.search,
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

// class CatagoryBox extends StatelessWidget {
//   const CatagoryBox(
//       {super.key,
//       required this.whenTapped,
//       required this.lable,
//       required this.isSelected});

//   final VoidCallback whenTapped;
//   final String lable;
//   final bool isSelected;

//   @override
//   Widget build(BuildContext context) {
//     return Flexible(
//       child: GestureDetector(
//         onTap: whenTapped,
//         child: Card(
//           color: isSelected ? primaryGreen : null,
//           margin: const EdgeInsets.all(0),
//           child: SizedBox(
//             width: double.infinity,
//             height: 30,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 5),
//               child: FittedBox(
//                   fit: BoxFit.scaleDown, child: Center(child: Text(lable))),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

import '../../../../core/constant_variables.dart';
import '../../../../core/enums.dart';
import '../../domain/scoring_screen_state.dart';
import 'painters/dart_icon.dart';

class ShotInfoBanner extends StatelessWidget {
  const ShotInfoBanner({super.key, required this.state});

  final ScoringScreenState state;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: darkShadowColor,
      child: Row(
        children: [
          SizedBox(
            width: 60,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: [
                  const SizedBox(width: 5),
                  for (var i = 0; i < state.dartsRemaining; i++)
                    if (state.selectedInput != ScoringInputMethod.keypad)
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: CustomPaint(
                          size: const Size(10, 30),
                          painter: DartIcon(),
                        ),
                      ),
                  // Container(
                  //   height: 30,
                  //   width: 4,
                  //   margin: const EdgeInsets.all(5.0),
                  //   decoration: BoxDecoration(
                  //       border: Border.all(color: primaryWhite),
                  //       borderRadius: BorderRadius.circular(100)),
                  // )
                ],
              ),
            ),
          ),
          Expanded(
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Icon(
              Icons.adjust,
              color: primaryWhite,
            ),
            const SizedBox(width: 5),
            Text(
              '${state.indicatedScore}',
              style: const TextStyle(color: primaryWhite),
            ),
          ])),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (var i = 0; i < 3; i++)
                Container(
                  margin: const EdgeInsets.all(5.0),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      color: primaryBlack,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                        state.indicatedDarts.length > i
                            ? state.indicatedDarts[i].lable
                            : '',
                        style: const TextStyle(color: primaryWhite)),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 5),
        ],
      ),
    );
  }
}

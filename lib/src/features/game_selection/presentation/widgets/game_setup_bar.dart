import 'package:flutter/material.dart';
import 'package:proscore_darts/src/core/constant_variables.dart';

import '../../../../router/router.dart';

class GameSetupBar extends StatelessWidget {
  const GameSetupBar(
      {super.key, required this.backLable, this.nextLable, this.onNextPressed});
  final VoidCallback? onNextPressed;
  final String backLable;
  final String? nextLable;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => router.pop(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    backLable,
                    style: const TextStyle(fontSize: 12, color: primaryWhite),
                  ),
                  const Text(
                    'Back',
                    style: TextStyle(fontSize: 16, color: primaryWhite),
                  ),
                ],
              ),
            ),
            if (nextLable != null)
              GestureDetector(
                onTap: onNextPressed,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      nextLable ?? '',
                      style: const TextStyle(fontSize: 12, color: primaryWhite),
                    ),
                    const Text(
                      'Next',
                      style: TextStyle(fontSize: 16, color: primaryWhite),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

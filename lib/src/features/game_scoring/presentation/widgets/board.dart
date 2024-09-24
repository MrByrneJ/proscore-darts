import 'package:flutter/material.dart';

import '../../../../core/constant_variables.dart';

class Board extends StatelessWidget {
  const Board({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size.width - 20,
        height: size.width - 20,
        decoration:
            const BoxDecoration(color: primaryBlack, shape: BoxShape.circle));
  }
}

import 'package:flutter/material.dart';
import 'package:proscore_darts/src/core/widgets/image_background_scaffold.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return const ImageBackgroundScaffold(
      child: Center(
          child: Padding(
        padding: EdgeInsets.only(bottom: 90, left: 10),
        child: SizedBox(
          width: 140,
          height: 150,
          child: CircularProgressIndicator(
            strokeWidth: 20.0,
            strokeCap: StrokeCap.round,
            color: Color.fromARGB(81, 209, 209, 209),
          ),
        ),
      )),
    );
  }
}

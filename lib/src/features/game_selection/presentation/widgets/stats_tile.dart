import 'package:flutter/material.dart';

class StatsTile extends StatelessWidget {
  const StatsTile({super.key, required this.lable, required this.stat});

  final String lable;
  final String stat;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.all(10),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                lable,
                textAlign: TextAlign.center,
                maxLines: 1,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                stat,
                textAlign: TextAlign.center,
                maxLines: 1,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

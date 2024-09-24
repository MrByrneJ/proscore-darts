import 'package:flutter/material.dart';

class ContentCard extends StatelessWidget {
  const ContentCard(
      {super.key, this.headline, this.action, required this.children});

  final String? headline;
  final Widget? action;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (headline != null)
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        headline ?? '',
                        style: Theme.of(context).textTheme.labelMedium,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  if (action != null)
                    Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: action),
                ],
              ),
              if (headline != null) const SizedBox(height: 10),
              ...children
            ],
          ),
        ),
      ),
    );
  }
}

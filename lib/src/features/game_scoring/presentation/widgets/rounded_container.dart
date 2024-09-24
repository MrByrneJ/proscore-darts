import 'package:flutter/widgets.dart';

import '../../../../core/constant_variables.dart';

class RoundedContainer extends StatelessWidget {
  const RoundedContainer({
    super.key,
    required this.child,
    this.width = double.infinity,
    this.height,
    this.padding = const EdgeInsets.all(0.0),
    this.margin = const EdgeInsets.all(0),
    this.color = primaryBlack,
    this.alignment = Alignment.center,
  });

  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final Alignment? alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: alignment,
        width: width,
        height: height ?? MediaQuery.of(context).size.height / 14,
        padding: padding,
        margin: margin,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(5), color: color),
        child: child);
  }
}

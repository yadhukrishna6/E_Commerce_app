import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/utills/constants/colors.dart';
import 'package:flutter_application_1/utills/helpers/helper_functions.dart';
import 'package:shimmer/shimmer.dart';

class TshimmerEffect extends StatelessWidget {
  const TshimmerEffect(
      {super.key,
      required this.width,
      required this.height,
      this.radius = 15,
      this.color});
  final double width, height, radius;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Shimmer.fromColors(
      baseColor: dark ? Colors.grey[850]! : Colors.grey[300]!,
      highlightColor: dark ? Colors.grey[700]! : Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: color ?? (dark ? TColors.darkergrey : TColors.textWhite),
            borderRadius: BorderRadius.circular(radius)),
      ),
    );
  }
}

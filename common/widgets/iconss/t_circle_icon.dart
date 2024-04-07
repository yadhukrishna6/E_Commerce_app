import 'package:flutter/material.dart';
import 'package:flutter_application_1/utills/constants/colors.dart';
import 'package:flutter_application_1/utills/constants/sizes.dart';
import 'package:flutter_application_1/utills/helpers/helper_functions.dart';

class TCircleIcon extends StatelessWidget {
  const TCircleIcon({
    super.key,
    required this.icon,
    this.color,
    this.backgroundcolor,
    this.onpressed,
    this.width,
    this.height,
    this.size = TSize.lg,
  });

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundcolor;
  final VoidCallback? onpressed;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: backgroundcolor != null
              ? backgroundcolor!
              : THelperFunction.isDarkMode(context)
                  ? TColors.black.withOpacity(0.9)
                  : TColors.textWhite.withOpacity(0.9),
          borderRadius: BorderRadius.circular(100),
        ),
        child: IconButton(
            onPressed: onpressed,
            icon: Icon(
              icon,
              color: color,
              size: size,
            )));
  }
}

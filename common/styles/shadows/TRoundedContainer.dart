import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/utills/constants/colors.dart';
import 'package:flutter_application_1/utills/constants/sizes.dart';

class TRoundedContainer extends StatelessWidget {
  const TRoundedContainer({
    super.key,
    this.width,
    this.height,
    this.radius = TSize.cardRadiusLg,
    this.padding,
    this.child,
    this.backgroundcolor = TColors.textWhite,
    this.margin,
    this.showborder = false,
    this.bordercolor = TColors.borderprimary,
  });
  final double? width;
  final double? height;
  final double radius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Widget? child;
  final bool showborder;
  final Color backgroundcolor;
  final Color bordercolor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: backgroundcolor,
          border: showborder ? Border.all(color: bordercolor) : null),
      child: child,
    );
  }
}

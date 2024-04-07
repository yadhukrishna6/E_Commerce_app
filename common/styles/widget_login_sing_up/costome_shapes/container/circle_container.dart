import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/utills/constants/colors.dart';

class TcircleContainer extends StatelessWidget {
  const TcircleContainer({
    super.key,
    this.width = 400,
    this.height = 400,
    this.radius = 400,
    this.padding = 0,
    this.child,
    this.backgroundcolor = TColors.textWhite,
    this.margin,
  });
  final double? width;
  final double? height;
  final double radius;
  final double padding;
  final EdgeInsets? margin;
  final Widget? child;
  final Color backgroundcolor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius), color: backgroundcolor),
      child: child,
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/utills/constants/colors.dart';

class TShadowStyle {
  static final verticalproductshadow = BoxShadow(
      color: TColors.darkgrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2));

  static final horizondalproductshadow = BoxShadow(
      color: TColors.darkgrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2));
}

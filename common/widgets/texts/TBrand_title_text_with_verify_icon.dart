import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/texts/TBrandTitleText.dart';
import 'package:flutter_application_1/utills/constants/colors.dart';
import 'package:flutter_application_1/utills/constants/enums.dart';
import 'package:flutter_application_1/utills/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class TBrandTitleTextWithVerify extends StatelessWidget {
  const TBrandTitleTextWithVerify({
    super.key,
    required this.title,
    this.maxlines = 1,
    this.textcolor,
    this.iconcolor = TColors.primaryColor,
    this.textAlign = TextAlign.center,
    this.brandtextsize = TextSizes.small,
  });
  final String title;
  final int maxlines;
  final Color? textcolor, iconcolor;
  final TextAlign? textAlign;
  final TextSizes brandtextsize;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: TBrandTitleText(
            title: title,
            maxlines: maxlines,
            color: textcolor,
            textAlign: textAlign,
            brandtextsize: brandtextsize,
          ),
        ),
        Icon(Iconsax.verify5, color: iconcolor, size: TSize.iconxs)
      ],
    );
  }
}

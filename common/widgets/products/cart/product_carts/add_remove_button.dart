import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/iconss/t_circle_icon.dart';
import 'package:flutter_application_1/utills/constants/colors.dart';
import 'package:flutter_application_1/utills/constants/sizes.dart';
import 'package:flutter_application_1/utills/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class TProductQualityAddRemove extends StatelessWidget {
  const TProductQualityAddRemove({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TCircleIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: TSize.md,
          color: THelperFunction.isDarkMode(context)
              ? TColors.textWhite
              : TColors.black,
          backgroundcolor: THelperFunction.isDarkMode(context)
              ? TColors.darkergrey
              : TColors.light,
        ),
        const SizedBox(width: TSize.spaceBtwItems),
        Text("2", style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: TSize.spaceBtwItems),
        const TCircleIcon(
            icon: Iconsax.add,
            width: 32,
            height: 32,
            size: TSize.md,
            color: TColors.textWhite,
            backgroundcolor: TColors.primaryColor),
      ],
    );
  }
}

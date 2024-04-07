import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/images_slider/Trounded_image.dart';
import 'package:flutter_application_1/common/widgets/texts/TBrand_title_text_with_verify_icon.dart';
import 'package:flutter_application_1/common/widgets/texts/product_title_text.dart';
import 'package:flutter_application_1/utills/constants/colors.dart';
import 'package:flutter_application_1/utills/constants/image_string.dart';
import 'package:flutter_application_1/utills/constants/sizes.dart';

import '../../../../utills/helpers/helper_functions.dart';

class TCartitem extends StatelessWidget {
  const TCartitem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TRoundedImage(
          imageUrl: Timages.nikeshoe,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(TSize.sm),
          backgroundColor: THelperFunction.isDarkMode(context)
              ? TColors.darkergrey
              : TColors.light,
        ),
        const SizedBox(width: TSize.spaceBtwItems),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TBrandTitleTextWithVerify(title: "Nike"),
              const Flexible(
                child: TProductTitleText(
                    title: 'Black Nike Air shoes', maxline: 1),
              ),
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: 'Color ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: 'Green ',
                    style: Theme.of(context).textTheme.bodyLarge),
                TextSpan(
                    text: 'Size ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: 'UK 08 ',
                    style: Theme.of(context).textTheme.bodyLarge),
              ]))
            ],
          ),
        )
      ],
    );
  }
}

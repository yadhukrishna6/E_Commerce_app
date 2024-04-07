import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/styles/shadows/TRoundedContainer.dart';
import 'package:flutter_application_1/common/widgets/texts/TBrand_title_text_with_verify_icon.dart';
import 'package:flutter_application_1/utills/constants/colors.dart';
import 'package:flutter_application_1/utills/constants/enums.dart';
import 'package:flutter_application_1/utills/constants/image_string.dart';
import 'package:flutter_application_1/utills/constants/sizes.dart';
import 'package:flutter_application_1/utills/helpers/helper_functions.dart';

import '../images_slider/TCircular_image.dart';

class TBrandCard extends StatelessWidget {
  const TBrandCard({
    super.key,
    required this.showBorder,
    this.OnTap,
  });
  final bool showBorder;
  final void Function()? OnTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: OnTap,
      child: TRoundedContainer(
        padding: const EdgeInsets.all(TSize.sm),
        showborder: showBorder,
        backgroundcolor: Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Tcircular_image(
                image: Timages.nikeico,
                isnetworkimage: false,
                backgroundColor: Colors.transparent,
                overlaycolor: THelperFunction.isDarkMode(context)
                    ? TColors.textWhite
                    : TColors.black,
              ),
            ),
            const SizedBox(width: TSize.spaceBtwItems / 2),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TBrandTitleTextWithVerify(
                      title: 'Nike', brandtextsize: TextSizes.large),
                  Text(
                    '256 Products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

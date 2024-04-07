import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/styles/shadows/TRoundedContainer.dart';
import 'package:flutter_application_1/common/widgets/images_slider/TCircular_image.dart';
import 'package:flutter_application_1/common/widgets/texts/TBrand_title_text_with_verify_icon.dart';
import 'package:flutter_application_1/common/widgets/texts/product_price_text.dart';
import 'package:flutter_application_1/common/widgets/texts/product_title_text.dart';
import 'package:flutter_application_1/utills/constants/colors.dart';
import 'package:flutter_application_1/utills/constants/enums.dart';
import 'package:flutter_application_1/utills/constants/image_string.dart';
import 'package:flutter_application_1/utills/constants/sizes.dart';
import 'package:flutter_application_1/utills/helpers/helper_functions.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunction.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///price & sale price
        Row(
          children: [
            ///sale tag
            TRoundedContainer(
              radius: TSize.sm,
              backgroundcolor: TColors.secondaryColor.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: TSize.sm, vertical: TSize.xs),
              child: Text('25%',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: TColors.black)),
            ),
            const SizedBox(width: TSize.spaceBtwItems),

            ///price
            Text('\$250',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .apply(decoration: TextDecoration.lineThrough)),
            const SizedBox(width: TSize.spaceBtwItems),
            const TProductPriceText(price: '175', isLarge: true),
          ],
        ),
        const SizedBox(height: TSize.spaceBtwItems / 1.5),

        ///title
        const TProductTitleText(title: 'Black Nike Air Shoe'),
        const SizedBox(height: TSize.spaceBtwItems / 1.5),

        ///stock-status
        Row(
          children: [
            const TProductTitleText(title: 'Status'),
            const SizedBox(width: TSize.spaceBtwItems),
            Text(
              'In Stock',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),

        const SizedBox(height: TSize.spaceBtwItems / 1.5),

        ///Brand
        Row(
          children: [
            Tcircular_image(
              image: Timages.nikeico,
              width: 32,
              height: 32,
              overlaycolor: darkMode ? TColors.textWhite : TColors.black,
            ),
            const TBrandTitleTextWithVerify(
              title: 'Nike',
              brandtextsize: TextSizes.medium,
            ),
          ],
        )
      ],
    );
  }
}

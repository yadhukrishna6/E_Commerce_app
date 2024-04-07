import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/styles/shadows/TRoundedContainer.dart';
import 'package:flutter_application_1/common/widgets/chips/choicechip.dart';
import 'package:flutter_application_1/common/widgets/texts/product_price_text.dart';
import 'package:flutter_application_1/common/widgets/texts/product_title_text.dart';
import 'package:flutter_application_1/common/widgets/texts/seaction_heading.dart';
import 'package:flutter_application_1/utills/constants/colors.dart';
import 'package:flutter_application_1/utills/constants/sizes.dart';
import 'package:flutter_application_1/utills/helpers/helper_functions.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Column(
      children: [
        TRoundedContainer(
          padding: const EdgeInsets.all(TSize.md),
          backgroundcolor: dark ? TColors.darkgrey : TColors.grey,
          child: Column(
            children: [
              Row(
                children: [
                  const TSectionHeading(title: 'Variation', showActionButton: false),
                  const SizedBox(width: TSize.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const TProductTitleText(title: 'Price : ', smallSize: true),
                          Text(
                            '\$125',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(width: TSize.spaceBtwItems),
                          const TProductPriceText(price: '120')
                        ],
                      ),
                      Row(
                        children: [
                          const TProductTitleText(title: 'Stock : ', smallSize: true),
                          Text(
                            'In Stock',
                            style: Theme.of(context).textTheme.titleMedium,
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const TProductTitleText(
                title:
                    "This is the Description of the product and it can go upto max 4 lines",
                smallSize: true,
                maxline: 4,
              )
            ],
          ),
        ),
        const SizedBox(height: TSize.spaceBtwItems),

        ///
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(
              title: 'Colors',
              showActionButton: false,
            ),
            const SizedBox(height: TSize.spaceBtwItems / 4),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(
                    text: 'green', selected: false, onselected: (Value) {}),
                TChoiceChip(
                    text: 'blue', selected: false, onselected: (Value) {}),
                TChoiceChip(
                    text: 'red', selected: false, onselected: (Value) {}),
              ],
            )
          ],
        ),
        const SizedBox(height: TSize.spaceBtwItems / 2),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(
              title: 'size',
              showActionButton: false,
            ),
            const SizedBox(height: TSize.spaceBtwItems / 4),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(
                    text: 'EU 34', selected: true, onselected: (Value) {}),
                TChoiceChip(
                    text: 'EU 36', selected: false, onselected: (Value) {}),
                TChoiceChip(
                    text: 'EU 38', selected: false, onselected: (Value) {}),
              ],
            )
          ],
        )
      ],
    );
  }
}

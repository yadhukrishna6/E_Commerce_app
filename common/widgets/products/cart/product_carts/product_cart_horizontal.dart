import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/styles/shadows/TRoundedContainer.dart';
import 'package:flutter_application_1/common/widgets/iconss/t_circle_icon.dart';
import 'package:flutter_application_1/common/widgets/images_slider/Trounded_image.dart';
import 'package:flutter_application_1/common/widgets/texts/TBrand_title_text_with_verify_icon.dart';
import 'package:flutter_application_1/common/widgets/texts/product_price_text.dart';
import 'package:flutter_application_1/common/widgets/texts/product_title_text.dart';
import 'package:flutter_application_1/utills/constants/colors.dart';
import 'package:flutter_application_1/utills/constants/image_string.dart';
import 'package:flutter_application_1/utills/constants/sizes.dart';
import 'package:flutter_application_1/utills/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class TProductCardHorizontal extends StatelessWidget {
  const TProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(TSize.productImageRadius),
        color: dark ? TColors.darkergrey : TColors.softgrey,
      ),
      child: Row(
        children: [
          ///thumbnail,
          TRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(TSize.sm),
            backgroundcolor: dark ? TColors.dark : TColors.light,
            child: Stack(
              children: [
                ///THumbnail-image
                const SizedBox(
                  height: 120,
                  width: 120,
                  child: TRoundedImage(
                      imageUrl: Timages.nikeshoe, applyimageradius: true),
                ),

                ///--sale-tag
                Positioned(
                  top: 12,
                  child: TRoundedContainer(
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
                ),

                ///Favourite-icon-button

                const Positioned(
                  top: 0,
                  right: 0,
                  child: TCircleIcon(icon: Iconsax.heart5, color: Colors.red),
                ),
              ],
            ),
          ),

          ///Details
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: TSize.sm, left: TSize.sm),
              child: Column(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TProductTitleText(
                          title: 'Black Nike Air shoes  rrrrrrrrrrrrrr',
                          smallSize: true),
                      SizedBox(height: TSize.spaceBtwItems / 2),
                      TBrandTitleTextWithVerify(title: 'Nike')
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(child: TProductPriceText(price: '256.0')),
                      Container(
                        decoration: const BoxDecoration(
                          color: TColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(TSize.cardRadiusMd),
                            bottomRight:
                                Radius.circular(TSize.productImageRadius),
                          ),
                        ),
                        child: const SizedBox(
                            width: TSize.iconlg * 1.2,
                            height: TSize.iconlg * 1.2,
                            child: Center(
                                child: Icon(Iconsax.add,
                                    color: TColors.textWhite))),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/styles/shadows/TRoundedContainer.dart';
import 'package:flutter_application_1/common/styles/shadows/shadows.dart';
import 'package:flutter_application_1/common/widgets/iconss/t_circle_icon.dart';
import 'package:flutter_application_1/common/widgets/images_slider/Trounded_image.dart';
import 'package:flutter_application_1/common/widgets/texts/TBrand_title_text_with_verify_icon.dart';
import 'package:flutter_application_1/common/widgets/texts/product_price_text.dart';
import 'package:flutter_application_1/common/widgets/texts/product_title_text.dart';
import 'package:flutter_application_1/features/shop/screen/product_detailes/widgets/product_details.dart';
import 'package:flutter_application_1/utills/constants/colors.dart';
import 'package:flutter_application_1/utills/constants/image_string.dart';
import 'package:flutter_application_1/utills/constants/sizes.dart';
import 'package:flutter_application_1/utills/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TProductCartVertical extends StatelessWidget {
  const TProductCartVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => const ProductDetail()),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            boxShadow: [TShadowStyle.verticalproductshadow],
            borderRadius: BorderRadius.circular(TSize.productImageRadius),
            color: dark ? TColors.darkergrey : TColors.textWhite),
        child: Column(
          children: [
            TRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(TSize.sm),
              backgroundcolor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  const TRoundedImage(
                      imageUrl: Timages.nikeshoe, applyimageradius: true),
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
                  const Positioned(
                      top: 0,
                      right: 0,
                      child: TCircleIcon(
                        icon: Iconsax.heart5,
                        color: Colors.red,
                      ))
                ],
              ),
            ),
            const SizedBox(height: TSize.spaceBtwItems / 2),
            const Padding(
              padding: EdgeInsets.only(left: TSize.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TProductTitleText(
                      title: "Black Nike Air Shoes", smallSize: true),
                  SizedBox(height: TSize.spaceBtwItems / 2),
                  TBrandTitleTextWithVerify(
                    title: 'Nike',
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: TSize.sm),
                  child: TProductPriceText(price: '35.0'),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: TColors.dark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(TSize.cardRadiusMd),
                      bottomRight: Radius.circular(TSize.productImageRadius),
                    ),
                  ),
                  child: const SizedBox(
                      width: TSize.iconlg * 1.2,
                      height: TSize.iconlg * 1.2,
                      child: Center(
                          child: Icon(Iconsax.add, color: TColors.textWhite))),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

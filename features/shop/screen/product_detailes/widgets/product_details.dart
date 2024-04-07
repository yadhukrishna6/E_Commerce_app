import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/texts/seaction_heading.dart';
import 'package:flutter_application_1/features/shop/screen/product_detailes/widgets/bottom_add_to_cart_widget.dart';
import 'package:flutter_application_1/features/shop/screen/product_detailes/widgets/product_attributes.dart';
import 'package:flutter_application_1/features/shop/screen/product_detailes/widgets/product_detail_image_slider.dart';
import 'package:flutter_application_1/features/shop/screen/product_detailes/widgets/product_meta_data.dart';
import 'package:flutter_application_1/features/shop/screen/product_detailes/widgets/rating_and_share.dart';
import 'package:flutter_application_1/features/shop/screen/product_reviews/widgets/product_reviews.dart';
import 'package:flutter_application_1/utills/constants/sizes.dart';
import 'package:flutter_application_1/utills/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: const TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///1-productimageslider
            const TProductImageSlider(),

            ///2-productdetails
            Padding(
              padding: const EdgeInsets.only(
                  right: TSize.defaultSpace,
                  left: TSize.defaultSpace,
                  bottom: TSize.defaultSpace),
              child: Column(
                children: [
                  ///rating and share button
                  const TRatingandshare(),

                  ///-price,title,stock,&brand
                  const ProductMetaData(),

                  ///attributs
                  const ProductAttributes(),
                  const SizedBox(height: TSize.spaceBtwItems),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text('checkout'))),
                  const SizedBox(height: TSize.spaceBtwItems),
                  const TSectionHeading(
                    title: 'Description',
                    showActionButton: false,
                  ),
                  const SizedBox(height: TSize.spaceBtwItems),
                  const ReadMoreText(
                    'Designed for comfortable wear for sports and street style, NIKE FOOTWEAR is always fun to wear. Upgrade in style with a wide range from the world’s leading and much-loved sports brand, NIKE.',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Less',
                    moreStyle: TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  ///reviews
                  const Divider(),
                  const SizedBox(height: TSize.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TSectionHeading(
                          title: 'Reviews(199)', showActionButton: false),
                      IconButton(
                        onPressed: () => Get.to(() => const ProductReviewScreen()),
                        icon: const Icon(Iconsax.arrow_right_3, size: 18),
                      )
                    ],
                  ),

                  const SizedBox(height: TSize.spaceBtwSections),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

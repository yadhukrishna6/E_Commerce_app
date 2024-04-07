// ignore_for_file: unused_import

import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/styles/widget_login_sing_up/costome_shapes/container/circle_container.dart';
import 'package:flutter_application_1/common/styles/widget_login_sing_up/costome_shapes/curved_shapes/curvedHeaderWidget.dart';
import 'package:flutter_application_1/common/styles/widget_login_sing_up/costome_shapes/curved_shapes/curved_edge_widget.dart';
import 'package:flutter_application_1/common/styles/widget_login_sing_up/costome_shapes/curved_shapes/curved_edges.dart';
import 'package:flutter_application_1/common/widgets/appbar/appbar.dart';
import 'package:flutter_application_1/common/widgets/appbar/search_container.dart';
import 'package:flutter_application_1/common/widgets/image_text_widgets/homeCategories.dart';
import 'package:flutter_application_1/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:flutter_application_1/common/widgets/images_slider/Trounded_image.dart';
import 'package:flutter_application_1/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_application_1/common/widgets/products/cart/product_carts/product_cart_vertical.dart';
import 'package:flutter_application_1/common/widgets/texts/Section_Heading.dart';
import 'package:flutter_application_1/features/authentication/screens/Home/home_appbar.dart';
import 'package:flutter_application_1/features/authentication/screens/widgets/promo_slider.dart';
import 'package:flutter_application_1/features/shop/controllers/home_controller.dart';
import 'package:flutter_application_1/features/shop/screen/all_products/all_products.dart';
import 'package:flutter_application_1/utills/constants/colors.dart';
import 'package:flutter_application_1/utills/constants/image_string.dart';
import 'package:flutter_application_1/utills/constants/sizes.dart';
import 'package:flutter_application_1/utills/constants/text_string.dart';
import 'package:flutter_application_1/utills/device/device_utillity.dart';
import 'package:flutter_application_1/utills/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TCurvedHeaderedgewidget(
              child: Column(
                children: [
                  THomeAppBar(),
                  SizedBox(height: TSize.spaceBtwItems),
                  TsearchContainer(text: 'Search in Store'),
                  SizedBox(height: TSize.spaceBtwItems),
                  Padding(
                    padding: EdgeInsets.only(left: TSize.defaultSpace),
                    child: Column(
                      children: [
                        TSectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textcolor: TColors.textWhite,
                        ),
                        SizedBox(height: TSize.spaceBtwItems),
                        THomeCategories(),
                      ],
                    ),
                  ),
                  SizedBox(height: TSize.spaceBtwSections)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(TSize.defaultSpace),
              child: Column(
                children: [
                  const TpromoSlider(
                    banners: [
                      Timages.shoes50,
                      Timages.dress,
                      Timages.dressnew50,
                      Timages.zara
                    ],
                  ),
                  const SizedBox(height: TSize.spaceBtwItems),
                  TSectionHeading(
                    title: 'Popular Products',
                    onpressed: () => Get.to(() => const AllProducts()),
                  ),
                  const SizedBox(height: TSize.spaceBtwItems),
                  TGridLayout(
                    itemCount: 4,
                    itemBuilder: (_, index) => const TProductCartVertical(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

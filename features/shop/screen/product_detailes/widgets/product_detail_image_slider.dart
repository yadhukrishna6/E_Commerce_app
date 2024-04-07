import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/styles/widget_login_sing_up/costome_shapes/curved_shapes/curved_edge_widget.dart';
import 'package:flutter_application_1/common/widgets/appbar/appbar.dart';
import 'package:flutter_application_1/common/widgets/iconss/t_circle_icon.dart';
import 'package:flutter_application_1/common/widgets/images_slider/Trounded_image.dart';
import 'package:flutter_application_1/utills/constants/image_string.dart';
import 'package:flutter_application_1/utills/constants/sizes.dart';
import 'package:flutter_application_1/utills/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utills/constants/colors.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return TCurvedEdgeWidget(
      child: Container(
        color: dark ? TColors.darkergrey : TColors.light,
        child: Stack(
          children: [
            const SizedBox(
                height: 400,
                child: Padding(
                  padding: EdgeInsets.all(TSize.productImageRadius * 2),
                  child:
                      Center(child: Image(image: AssetImage(Timages.nikeshoe))),
                )),
            Positioned(
              right: 0,
              bottom: 30,
              left: TSize.defaultSpace,
              child: SizedBox(
                height: 78,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => const SizedBox(
                    width: TSize.spaceBtwItems,
                  ),
                  itemBuilder: (_, index) => TRoundedImage(
                      width: 78,
                      backgroundColor: dark ? TColors.dark : TColors.textWhite,
                      border: Border.all(color: TColors.primaryColor),
                      padding: const EdgeInsets.all(TSize.sm),
                      imageUrl: Timages.newshoe1),
                  itemCount: 6,
                ),
              ),
            ),
            const TappBar(
              showbackarrow: true,
              actions: [
                TCircleIcon(
                  icon: Iconsax.heart5,
                  color: Colors.red,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

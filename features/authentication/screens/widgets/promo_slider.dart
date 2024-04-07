import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/styles/widget_login_sing_up/costome_shapes/container/circle_container.dart';
import 'package:flutter_application_1/common/widgets/images_slider/Trounded_image.dart';
import 'package:flutter_application_1/features/shop/controllers/home_controller.dart';
import 'package:flutter_application_1/utills/constants/colors.dart';
import 'package:flutter_application_1/utills/constants/sizes.dart';
import 'package:get/get.dart';

class TpromoSlider extends StatelessWidget {
  const TpromoSlider({
    super.key,
    required this.banners,
  });
  final List<String> banners;
  @override
  Widget build(BuildContext context) {
    final Controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          items: banners.map((Url) => TRoundedImage(imageUrl: Url)).toList(),
          options: CarouselOptions(
              viewportFraction: 1,
              onPageChanged: (index, _) =>
                  Controller.updatePageIndicator(index)),
        ),
        const SizedBox(height: TSize.spaceBtwItems),
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < banners.length; i++)
                  TcircleContainer(
                    width: 20,
                    height: 4,
                    margin: const EdgeInsets.only(right: 10),
                    backgroundcolor: Controller.CarousalCurrentIndex.value == i
                        ? TColors.primaryColor
                        : TColors.grey,
                  ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/appbar/appbar.dart';
import 'package:flutter_application_1/common/widgets/products/cart/cartfunctions.dart';
import 'package:flutter_application_1/features/authentication/screens/Home/shimmer.dart';
import 'package:flutter_application_1/features/personalization/controllers/user_controllers.dart';
import 'package:flutter_application_1/utills/constants/colors.dart';
import 'package:flutter_application_1/utills/constants/text_string.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserControllers());
    return TappBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(TTexts.homeAppbarTitle,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: TColors.grey)),
          Obx(() {
            if (controller.profileLoading.value) {
              return const TshimmerEffect(width: 80, height: 15);
            } else {
              return Text(controller.user.value.fullName,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .apply(color: TColors.textWhite));
            }
          }),
        ],
      ),
      actions: [
        TcartFunction(
          onpressed: () {},
          iconcolor: TColors.textWhite,
          counterBgColor: TColors.black,
          counterTextColor: TColors.textWhite,
        )
      ],
    );
  }
}

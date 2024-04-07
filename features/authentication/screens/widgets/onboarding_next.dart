import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:flutter_application_1/utills/constants/colors.dart';
import 'package:flutter_application_1/utills/constants/sizes.dart';
import 'package:flutter_application_1/utills/device/device_utillity.dart';
import 'package:flutter_application_1/utills/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class onBoardingNextButton extends StatelessWidget {
  const onBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Positioned(
        right: TSize.defaultSpace,
        bottom: TDeviceUtils.getBottonNavigationBarHeight(),
        child: ElevatedButton(
            onPressed: () => OnBoardingController.instance.nextPage(),
            style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                backgroundColor: dark ? TColors.primaryColor : Colors.black),
            child: const Icon(Iconsax.arrow_right_3)));
  }
}

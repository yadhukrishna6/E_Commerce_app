import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/authentication/controllers/login/login_controller.dart';
import 'package:flutter_application_1/utills/constants/colors.dart';
import 'package:flutter_application_1/utills/constants/image_string.dart';
import 'package:flutter_application_1/utills/constants/sizes.dart';
import 'package:get/get.dart';

class socialButtons extends StatelessWidget {
  const socialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: TColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
              onPressed: () => controller.googleSignIn(),
              icon: const Image(
                  width: TSize.iconmd,
                  height: TSize.iconmd,
                  image: AssetImage(Timages.google))),
        ),
        const SizedBox(width: TSize.spaceBtwItems),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: TColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
              onPressed: () {},
              icon: const Image(
                  width: TSize.iconmd,
                  height: TSize.iconmd,
                  image: AssetImage(Timages.facebook))),
        ),
      ],
    );
  }
}

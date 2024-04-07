import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:flutter_application_1/utills/constants/sizes.dart';

import '../../../../utills/device/device_utillity.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: TDeviceUtils.getAppBarHeight() +
          TSize.defaultSpace, // Adjust top position as needed
      right: TSize.defaultSpace,
      child: TextButton(
        onPressed: () => OnBoardingController.instance.skipPage,
        // Handle SKIP button tap

        child: const Text("SKIP"),
      ),
    );
  }
}

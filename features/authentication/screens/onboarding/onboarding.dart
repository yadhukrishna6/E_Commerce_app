import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:flutter_application_1/features/authentication/screens/widgets/onboarding_dot.dart';
import 'package:flutter_application_1/features/authentication/screens/widgets/onboarding_next.dart';
import 'package:flutter_application_1/features/authentication/screens/widgets/onboarding_skip.dart';
import 'package:flutter_application_1/features/authentication/screens/widgets/onbording_page.dart';

import 'package:flutter_application_1/utills/constants/image_string.dart';

import 'package:flutter_application_1/utills/constants/text_string.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          // PageView wrapped in Expanded to take full screen
          Expanded(
            child: PageView(
              controller: controller.pageController,
              onPageChanged: controller.updatePageIndicator,
              children: const [
                OnBoardingPage(
                  image: Timages.OnBoardingImage3,
                  title: TTexts.onBoardingTitle1,
                  subtitle: TTexts.onBoardingSubTitle1,
                ),
                OnBoardingPage(
                  image: Timages.OnBoardingImage2,
                  title: TTexts.onBoardingTitle2,
                  subtitle: TTexts.onBoardingSubTitle2,
                ),
                OnBoardingPage(
                  image: Timages.OnBoardingImage1,
                  title: TTexts.onBoardingTitle3,
                  subtitle: TTexts.onBoardingSubTitle3,
                ),
              ],
            ),
          ),
          // Positioned widget for SKIP button
          const OnBoardingSkip(),
          const onboardingdot(),
          const onBoardingNextButton(),
        ],
      ),
    );
  }
}

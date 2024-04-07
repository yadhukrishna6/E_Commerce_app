import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/common/styles/widget_login_sing_up/success_screen/success_screen.dart';
import 'package:flutter_application_1/common/widgets/loaders/loaders.dart';
import 'package:flutter_application_1/data/repositories/authentication_repositorie.dart';
import 'package:flutter_application_1/utills/constants/image_string.dart';
import 'package:flutter_application_1/utills/constants/text_string.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  ///send-email-whenever-verify-screen-appears&set-timer-for-auto-redirect.
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  ///send-email-verification-link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackBar(
          title: 'Email sent',
          message: 'Please Check your inbox and verify your email.');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'oh Snap', message: e.toString());
    }
  }

  ///timer-to-automatically-redirect-on-email-verification
  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => SuccessScreen(
              image: Timages.successfulpayment,
              title: TTexts.yourAccountCreatedTitle,
              subtitle: TTexts.yourAccountCreatedSubTitle,
              onpressed: () =>
                  AuthenticationRepository.instance.screenRedirect(),
            ));
      }
    });
  }

  ///manually-check-if-email-verified
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(() => SuccessScreen(
            image: Timages.successfulpayment,
            title: TTexts.yourAccountCreatedTitle,
            subtitle: TTexts.yourAccountCreatedSubTitle,
            onpressed: () => AuthenticationRepository.instance.screenRedirect(),
          ));
    }
  }
}

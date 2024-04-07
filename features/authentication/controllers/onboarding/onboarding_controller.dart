import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/authentication/screens/onboarding/login/login.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  ///variables
  final pageController = PageController();
  Rx<int> CurrentPageIndex = 0.obs;

  ///update current index when page scroll
  void updatePageIndicator(index) => CurrentPageIndex.value = index;

  ///jumptonxtselectedpage
  void dotNavigationClick(index) {
    CurrentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  ///update current index and jump to next page
  void nextPage() {
    if (CurrentPageIndex.value == 2) {
      final Storage = GetStorage();
      if (kDebugMode) {
        print('Get Storage next button');
        print(Storage.read('isFirstTime'));
      }
      Storage.write("isFirstTime", false);

      if (kDebugMode) {
        print('Get Storage next button');
        print(Storage.read('isFirstTime'));
      }
      Get.offAll(const LoginScreen());
    } else {
      int page = CurrentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  ///update current index and jump to lastpage
  void skipPage(index) {
    CurrentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}

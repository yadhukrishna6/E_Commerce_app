import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/common/widgets/loaders/loaders.dart';
import 'package:flutter_application_1/data/repositories/network_manager.dart';
import 'package:flutter_application_1/data/repositories/userRepository.dart';
import 'package:flutter_application_1/features/personalization/controllers/user_controllers.dart';
import 'package:flutter_application_1/features/personalization/screens/profile/widgets/profile.dart';
import 'package:flutter_application_1/utills/constants/image_string.dart';
import 'package:flutter_application_1/utills/popups/fullscreenloader.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class UpdateNameControllers extends GetxController {
  static UpdateNameControllers get instance => Get.find();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserControllers.instance;
  final userRepository = Get.put(USerRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstname;
    lastName.text = userController.user.value.lastname;
  }

  Future<void> updateUserName() async {
    try {
      TFullScreenLoader.openloadingdilogue(
          'we are updating your information...', Timages.loaderss);
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stoploading();
        return;
      }
      if (!updateUserNameFormKey.currentState!.validate()) {
        TFullScreenLoader.stoploading();
        return;
      }

// Update user's first & last name in the Firebase Firestore
      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'Last Name': lastName.text.trim()
      };
      await userRepository.updateSingleField(name);

// Update the Rx User value
      userController.user.value.firstname = firstName.text.trim();
      userController.user.value.lastname = lastName.text.trim();
// Remove Loader
      TFullScreenLoader.stoploading();
// Show Success Message
      TLoaders.successSnackBar(
          title: 'Congratulations', message: 'Your Name has been updated.');
// Move to previous screen.
      Get.off(() => const ProfileScreen());
    } catch (e) {
      TFullScreenLoader.stoploading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}

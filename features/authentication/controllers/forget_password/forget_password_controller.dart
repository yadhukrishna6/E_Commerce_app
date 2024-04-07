import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/common/widgets/loaders/loaders.dart';
import 'package:flutter_application_1/data/repositories/authentication_repositorie.dart';
import 'package:flutter_application_1/data/repositories/network_manager.dart';
import 'package:flutter_application_1/features/authentication/screens/password_confirguration/reset_password.dart';
import 'package:flutter_application_1/utills/constants/image_string.dart';
import 'package:flutter_application_1/utills/popups/fullscreenloader.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ForgetPsswordControllers extends GetxController {
  static ForgetPsswordControllers get instance => Get.find();
  final email = TextEditingController();
  GlobalKey<FormState> forgetpasswordforkey = GlobalKey<FormState>();

  ///send reset-password-email
  sendPasswordResetEmail() async {
    try {
      TFullScreenLoader.openloadingdilogue(
          'Processing your request....', Timages.loaderss);
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stoploading();
        return;
      }
      if (!forgetpasswordforkey.currentState!.validate()) {
        TFullScreenLoader.stoploading();
        return;
      }
      await AuthenticationRepository.instance
          .sendpasswordresetemail(email.text.trim());
      TFullScreenLoader.stoploading();
      TLoaders.successSnackBar(
          title: 'Email sent',
          message: 'Email Link Sent to Reset your Password'.tr);
      Get.to(() => ResetPassword(email: email.text.trim()));
    } catch (e) {
      TFullScreenLoader.stoploading();
      TLoaders.errorSnackBar(title: 'oh Snap', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      TFullScreenLoader.openloadingdilogue(
          'Processing your request....', Timages.loaderss);
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stoploading();
        return;
      }
      await AuthenticationRepository.instance.sendpasswordresetemail(email);
      TFullScreenLoader.stoploading();
      TLoaders.successSnackBar(
          title: 'Email sent',
          message: 'Email Link Sent to Reset your Password'.tr);
    } catch (e) {
      TFullScreenLoader.stoploading();
      TLoaders.errorSnackBar(title: 'oh Snap', message: e.toString());
    }
  }
}

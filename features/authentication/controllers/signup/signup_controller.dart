import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/loaders/loaders.dart';
import 'package:flutter_application_1/data/repositories/authentication_repositorie.dart';
import 'package:flutter_application_1/data/repositories/network_manager.dart';
import 'package:flutter_application_1/data/repositories/userRepository.dart';
import 'package:flutter_application_1/data/repositories/user_model.dart';
import 'package:flutter_application_1/features/authentication/screens/onboarding/signup_widget/verify_email.dart';
import 'package:flutter_application_1/utills/constants/image_string.dart';
import 'package:flutter_application_1/utills/popups/fullscreenloader.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  ///variables
  final hidepassword = true.obs;
  final privacypolicy = true.obs;
  final email = TextEditingController();
  final lastname = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstname = TextEditingController();
  final phonenumber = TextEditingController();
  GlobalKey<FormState> signupformkey = GlobalKey<FormState>();

  ///signup
  void signup() async {
    try {
      //start loading
      TFullScreenLoader.openloadingdilogue(
          'we are processing your information...', Timages.loaderss);
      //check internet connection
      final isconnected = await NetworkManager.instance.isConnected();
      if (!isconnected) {
        TFullScreenLoader.stoploading();

        return;
      }
      //form validation
      if (!signupformkey.currentState!.validate()) {
        TFullScreenLoader.stoploading();
        return;
      }
      //privacy policy check
      if (!privacypolicy.value) {
        TLoaders.warningSnackBar(
            title: "Accpet Privacy policy",
            message:
                'In Order to create account , you must have to read and accept the privacy policy & terms of use.');
        return;
      }
      //reigister firebase $ save user data in firebase
      final UserCredential = await AuthenticationRepository.instance
          .registerwithEmailandpassword(
              email.text.trim(), password.text.trim());
      //save user data infirebase
      final NewUser = UserModel(
        id: UserCredential.user!.uid,
        username: username.text.trim(),
        email: email.text.trim(),
        firstname: firstname.text.trim(),
        lastname: lastname.text.trim(),
        phoneNumber: phonenumber.text.trim(),
        profilepicture: '',
      );
      final UserRepository = Get.put(USerRepository());
      await UserRepository.saveUserRecord(NewUser);
      //remove load
      TFullScreenLoader.stoploading();
      //show Success message
      TLoaders.successSnackBar(
          title: "congratulations",
          message: 'your account has been created! verify email to continue');

      //Move-to verify email screen

      Get.to(() => VerifyEmailScreen(
            email: email.text.trim(),
          ));
    } catch (e) {
      TFullScreenLoader.stoploading();
      TLoaders.errorSnackBar(title: 'oh snap!', message: e.toString());
      //show some error to user
    }
  }
}

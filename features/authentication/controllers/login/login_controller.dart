import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/common/widgets/loaders/loaders.dart';
import 'package:flutter_application_1/data/repositories/authentication_repositorie.dart';
import 'package:flutter_application_1/data/repositories/network_manager.dart';
import 'package:flutter_application_1/features/personalization/controllers/user_controllers.dart';
import 'package:flutter_application_1/utills/constants/image_string.dart';
import 'package:flutter_application_1/utills/popups/fullscreenloader.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  ///variables
  final rememberMe = false.obs;
  final hidepassword = true.obs;
  final localstorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userControllers = Get.put(UserControllers());
  @override
  @override
  void onInit() {
    final rememberedEmail = localstorage.read('Remember Me Email') ?? '';
    final rememberedPassword = localstorage.read('Remember Me Password') ?? '';
    email.text = rememberedEmail;
    password.text = rememberedPassword;
    super.onInit();
  }

  ///email-and-password-signin
  Future<void> emailAndpasswordSignIn() async {
    try {
      //start loading
      TFullScreenLoader.openloadingdilogue('Logging you in', Timages.loaderss);

      ///Check internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stoploading();
        return;
      }
//form validation
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stoploading();
        return;
      }

      ///save data if remember me is selected
      if (rememberMe.value) {
        localstorage.write('Remember Me Email', email.text.trim());
        localstorage.write('Remember Me Password', password.text.trim());
      }

      ///login user using email&password authentication
      final UserCredential = await AuthenticationRepository.instance
          .loginwithwithEmailandpassword(
              email.text.trim(), password.text.trim());
//remove loader
      TFullScreenLoader.stoploading();
//Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stoploading();
      TLoaders.errorSnackBar(title: 'oh Snap', message: toString());
    }
  }

  ///google-signIn-Authentication
  Future<void> googleSignIn() async {
    try {
      TFullScreenLoader.openloadingdilogue(
          'Logging you in...', Timages.loaderss);
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stoploading();
        return;
      }
      //googleauthentication
      final UserCredential =
          await AuthenticationRepository.instance.signInWithGoogle();
      await userControllers.saveUserRecord(UserCredential);
      TFullScreenLoader.stoploading();

      ///redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stoploading();
      TLoaders.errorSnackBar(title: 'oh snap', message: e.toString());
    }
  }
}

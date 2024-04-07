import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/common/widgets/loaders/loaders.dart';
import 'package:flutter_application_1/data/repositories/authentication_repositorie.dart';
import 'package:flutter_application_1/data/repositories/network_manager.dart';
import 'package:flutter_application_1/data/repositories/userRepository.dart';
import 'package:flutter_application_1/data/repositories/user_model.dart';
import 'package:flutter_application_1/features/authentication/screens/onboarding/login/login.dart';
import 'package:flutter_application_1/features/personalization/screens/profile/widgets/re_authentication_user_login.dart';
import 'package:flutter_application_1/utills/constants/image_string.dart';
import 'package:flutter_application_1/utills/constants/sizes.dart';
import 'package:flutter_application_1/utills/popups/fullscreenloader.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserControllers extends GetxController {
  static UserControllers get instance => Get.find();

  final profileLoading = false.obs;
  final Rx<UserModel> user = UserModel.empty().obs;

  final hidepassword = false.obs;
  final imageUploading = false.obs;
  final verifyEmail = TextEditingController();
  final verifypassword = TextEditingController();
  final userRepository = Get.put(USerRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  ///fetchuserrecord
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  ///saveuserrecord
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      await fetchUserRecord();
      if (user.value.id.isEmpty) {
        if (userCredential != null) {
          final nameparts =
              UserModel.nameparts(userCredential.user!.displayName ?? '');
          final username = UserModel.genarateusername(
              userCredential.user!.displayName ?? '');

          ///mapdata
          final user = UserModel(
            id: userCredential.user!.uid,
            username: username,
            email: userCredential.user!.email ?? '',
            firstname: nameparts[0],
            lastname: nameparts.length > 1 ? nameparts.sublist(1).join('') : '',
            phoneNumber: userCredential.user!.phoneNumber ?? '',
            profilepicture: userCredential.user!.photoURL ?? '',
          );
          //saveuserdata
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      TLoaders.warningSnackBar(
          title: 'Data not saved',
          message:
              'somthing went wrong while saving your information. you can re-save your data in your profile');
    }
  }

  /// Delete Account Warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(TSize.md),
        title: 'Delete Account',
        middleText:
            'Are you sure you want to delete your account permanently? This action is not reversible and all of your data will be removed permanently.',
        confirm: ElevatedButton(
          onPressed: () async => deleteUserAccount(),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              side: const BorderSide(color: Colors.red)),
          child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: TSize.lg),
              child: Text('Delete')),
        ),
        cancel: OutlinedButton(
          child: const Text('Cancel'),
          onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        ));
  }

  /// Delete User Account
  void deleteUserAccount() async {
    try {
      TFullScreenLoader.openloadingdilogue('Processing', Timages.loaderss);

      /// First re-authenticate user
      final auth = AuthenticationRepository.instance;
      var provider = auth.authuser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
// Re Verify Auth Email
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          TFullScreenLoader.stoploading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          TFullScreenLoader.stoploading();
          Get.to(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      TFullScreenLoader.stoploading();
      TLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// RE-AUTHENTICATE before deleting
  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      TFullScreenLoader.openloadingdilogue('Processing', Timages.loaderss);
//Check Internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stoploading();
        return;
      }
      if (!reAuthFormKey.currentState!.validate()) {
        TFullScreenLoader.stoploading();
        return;
      }
      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(
              verifyEmail.text.trim(), verifypassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      TFullScreenLoader.stoploading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      TFullScreenLoader.stoploading();
      TLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  uploadUserProfilePicture() async {
    try {
      final Image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);
      if (Image != null) {
        imageUploading.value = true;
        final imageUrl =
            await userRepository.uploadImage('Users/Images/Profile/', Image);
        Map<String, dynamic> json = {'profilepicture': imageUrl};
        await userRepository.updateSingleField(json);
        user.value.profilepicture = imageUrl;
        user.refresh();
        TLoaders.successSnackBar(
            title: 'congratulations',
            message: 'your profile image has been updated');
      }
    } catch (e) {
      TLoaders.errorSnackBar(
          title: 'Oh Snap!', message: 'something went wrong:$e');
    } finally {
      imageUploading.value = false;
    }
  }
}

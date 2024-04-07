import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/appbar/appbar.dart';
import 'package:flutter_application_1/common/widgets/images_slider/TCircular_image.dart';
import 'package:flutter_application_1/common/widgets/texts/seaction_heading.dart';
import 'package:flutter_application_1/features/authentication/screens/Home/shimmer.dart';
import 'package:flutter_application_1/features/personalization/controllers/user_controllers.dart';
import 'package:flutter_application_1/features/personalization/screens/profile/widgets/Changename.dart';
import 'package:flutter_application_1/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:flutter_application_1/utills/constants/image_string.dart';
import 'package:flutter_application_1/utills/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserControllers.instance;
    return Scaffold(
      appBar: const TappBar(
        showbackarrow: true,
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSize.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilepicture;
                      final Image = networkImage.isNotEmpty
                          ? networkImage
                          : Timages.profile;
                      return controller.imageUploading.value
                          ? const TshimmerEffect(
                              width: 80,
                              height: 80,
                              radius: 80,
                            )
                          : Tcircular_image(
                              image: Image,
                              width: 80,
                              height: 80,
                              isnetworkimage: networkImage.isNotEmpty);
                    }),
                    TextButton(
                        onPressed: () => controller.uploadUserProfilePicture(),
                        child: const Text('Change Profile Picture')),
                  ],
                ),
              ),
              const SizedBox(height: TSize.spaceBtwItems / 6),
              const Divider(),
              const SizedBox(height: TSize.spaceBtwItems),
              const TSectionHeading(
                  title: 'Profile Information', showActionButton: false),
              const SizedBox(height: TSize.spaceBtwItems),
              profilemenu(
                  onpressed: () => Get.to(() => const ChangeName()),
                  title: 'Name',
                  value: controller.user.value.fullName),
              profilemenu(
                  onpressed: () {},
                  title: 'Username',
                  value: controller.user.value.username),
              const SizedBox(height: TSize.spaceBtwItems / 6),
              const Divider(),
              const SizedBox(height: TSize.spaceBtwItems),
              const TSectionHeading(
                  title: 'Personal Information', showActionButton: false),
              const SizedBox(height: TSize.spaceBtwItems / 6),

              ///
              profilemenu(
                onpressed: () {},
                title: 'User ID',
                value: controller.user.value.id,
                icon: Iconsax.copy,
              ),
              profilemenu(
                  onpressed: () {},
                  title: 'Email',
                  value: controller.user.value.email),
              profilemenu(
                  onpressed: () {},
                  title: 'phone Number',
                  value: controller.user.value.phoneNumber),
              profilemenu(onpressed: () {}, title: 'Gender', value: 'Male'),
              profilemenu(
                  onpressed: () {},
                  title: 'Date of Birth',
                  value: '24/04/2001'),
              const Divider(),
              const SizedBox(height: TSize.spaceBtwItems),
              Center(
                child: TextButton(
                    onPressed: () => controller.deleteAccountWarningPopup(),
                    child: const Text(
                      "Close Account",
                      style: TextStyle(color: Colors.red),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

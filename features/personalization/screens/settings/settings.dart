import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/styles/widget_login_sing_up/costome_shapes/curved_shapes/curvedHeaderWidget.dart';
import 'package:flutter_application_1/common/widgets/appbar/appbar.dart';
import 'package:flutter_application_1/common/widgets/list_tile/setting_menu_tile.dart';
import 'package:flutter_application_1/common/widgets/list_tile/userprofiletile.dart';
import 'package:flutter_application_1/common/widgets/texts/seaction_heading.dart';
import 'package:flutter_application_1/data/repositories/authentication_repositorie.dart';
import 'package:flutter_application_1/features/personalization/screens/address/widget/address.dart';
import 'package:flutter_application_1/features/personalization/screens/profile/widgets/profile.dart';
import 'package:flutter_application_1/features/shop/screen/order/widget/order.dart';
import 'package:flutter_application_1/utills/constants/colors.dart';
import 'package:flutter_application_1/utills/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TCurvedHeaderedgewidget(
              child: Column(
                children: [
                  TappBar(
                      title: Text('Account',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .apply(color: TColors.textWhite))),
                  const SizedBox(height: TSize.spaceBtwSections),
                  TUserProfileTag(
                    onpressed: () => Get.to(() => const ProfileScreen()),
                  ),
                  const SizedBox(height: TSize.spaceBtwSections),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(TSize.defaultSpace),
              child: Column(
                children: [
                  const TSectionHeading(
                      title: 'Account Settings', showActionButton: false),
                  const SizedBox(height: TSize.spaceBtwItems),
                  TSettingMenuTile(
                      icon: Iconsax.safe_home,
                      title: 'My Addresses',
                      subtitle: 'Set Shopping delivery address',
                      ontap: () => Get.to(() => const UserAddressScreen())),
                  TSettingMenuTile(
                      icon: Iconsax.shopping_cart,
                      title: 'My Cart',
                      subtitle: 'Add, remove products and move to checkout',
                      ontap: () {}),
                  TSettingMenuTile(
                      icon: Iconsax.bag_tick,
                      title: 'My Orders',
                      subtitle: 'In-progress and completed orders',
                      ontap: () => Get.to(() => const OrderScreen())),
                  TSettingMenuTile(
                      icon: Iconsax.bank,
                      title: 'Bank Account',
                      subtitle: 'Withdraw balance to registered bank account',
                      ontap: () {}),
                  TSettingMenuTile(
                      icon: Iconsax.discount_shape,
                      title: 'My Coupons',
                      subtitle: 'List of all discount coupons',
                      ontap: () {}),
                  TSettingMenuTile(
                      icon: Iconsax.notification,
                      title: 'Notifications',
                      subtitle: 'Set any kind of notification message',
                      ontap: () {}),
                  TSettingMenuTile(
                      icon: Iconsax.security_card,
                      title: 'Account privacy',
                      subtitle: 'Manage data usage and connected accounts',
                      ontap: () {}),

                  ///appsetting
                  const SizedBox(height: TSize.spaceBtwSections),
                  const TSectionHeading(
                      title: 'App Settings', showActionButton: false),
                  const SizedBox(height: TSize.spaceBtwItems),
                  TSettingMenuTile(
                      icon: Iconsax.document_upload,
                      title: 'Local Data',
                      subtitle: 'Uplode Data to your cloud firebase',
                      ontap: () {}),
                  TSettingMenuTile(
                    icon: Iconsax.location,
                    title: 'Geolocation',
                    subtitle: 'Set recommendation based on location',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  TSettingMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Safe Mode',
                    subtitle: 'Search result is safe for all ages',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  TSettingMenuTile(
                    icon: Iconsax.image,
                    title: 'HD Image Quality',
                    subtitle: 'Set image quality to be seen',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),

                  ///logoutbutton
                  const SizedBox(height: TSize.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: () =>
                            AuthenticationRepository.instance.logout(),
                        child: const Text('Logout')),
                  ),
                  const SizedBox(height: TSize.spaceBtwSections * 2.5),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

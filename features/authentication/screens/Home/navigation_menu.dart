import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/authentication/screens/Home/home_screen.dart';
import 'package:flutter_application_1/features/personalization/screens/settings/settings.dart';
import 'package:flutter_application_1/features/shop/screen/store/store.dart';
import 'package:flutter_application_1/features/shop/screen/wishlist/wishlist.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationConroller());
    return Scaffold(
        bottomNavigationBar: Obx(
          () => NavigationBar(
            height: 80,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) =>
                controller.selectedIndex.value = index,
            destinations: const [
              NavigationDestination(icon: Icon(Iconsax.home), label: "Home"),
              NavigationDestination(icon: Icon(Iconsax.shop), label: "Store"),
              NavigationDestination(
                  icon: Icon(Iconsax.heart), label: "wishlist"),
              NavigationDestination(icon: Icon(Iconsax.user), label: "Profile"),
            ],
          ),
        ),
        body: Obx(() => controller.Screens[controller.selectedIndex.value]));
  }
}

class NavigationConroller extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final Screens = [
    const HomeScreen(),
    const TStore(),
    const FavouriteScreen(),
    const SettingScreen(),
    Container(color: Colors.green),
  ];
}

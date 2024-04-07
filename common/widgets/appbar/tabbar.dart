import 'package:flutter/material.dart';
import 'package:flutter_application_1/utills/constants/colors.dart';
import 'package:flutter_application_1/utills/device/device_utillity.dart';
import 'package:flutter_application_1/utills/helpers/helper_functions.dart';

class TTabBar extends StatelessWidget implements PreferredSizeWidget {
  const TTabBar({super.key, required this.tabs});
  final List<Widget> tabs;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Material(
        color: dark ? TColors.black : TColors.textWhite,
        child: TabBar(
          tabs: tabs,
          isScrollable: true,
          indicatorColor: TColors.primaryColor,
          labelColor: dark ? TColors.textWhite : TColors.primaryColor,
          unselectedLabelColor: TColors.darkergrey,
        ));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}

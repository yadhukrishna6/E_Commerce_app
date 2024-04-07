import 'package:flutter/material.dart';
import 'package:flutter_application_1/utills/constants/colors.dart';
import 'package:flutter_application_1/utills/constants/sizes.dart';
import 'package:flutter_application_1/utills/device/device_utillity.dart';
import 'package:flutter_application_1/utills/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TappBar extends StatelessWidget implements PreferredSizeWidget {
  const TappBar({
    super.key,
    this.title,
    this.showbackarrow = false,
    this.leadingicon,
    this.actions,
    this.leadingOnpressed,
  });
  final Widget? title;
  final bool showbackarrow;
  final IconData? leadingicon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnpressed;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSize.md),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: showbackarrow
            ? IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Iconsax.arrow_left,
                  color: dark ? TColors.textWhite : TColors.dark,
                ))
            : leadingicon != null
                ? IconButton(
                    onPressed: () => Get.back(), icon: Icon(leadingicon))
                : null,
        title: title,
        actions: actions,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}

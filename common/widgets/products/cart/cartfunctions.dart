import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/shop/screen/cart/widgets/cart.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utills/constants/colors.dart';

class TcartFunction extends StatelessWidget {
  const TcartFunction({
    super.key,
    required this.onpressed,
    this.iconcolor,
    this.counterBgColor,
    this.counterTextColor,
  });
  final VoidCallback onpressed;
  final Color? iconcolor, counterBgColor, counterTextColor;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
            onPressed: () => Get.to(() => const CartScreen()),
            icon: Icon(Iconsax.shopping_bag, color: iconcolor)),
        Positioned(
            right: 0,
            child: Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                color: TColors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Text(
                  '2',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: TColors.textWhite),
                ),
              ),
            ))
      ],
    );
  }
}

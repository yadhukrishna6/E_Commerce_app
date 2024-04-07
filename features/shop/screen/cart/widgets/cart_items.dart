import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:flutter_application_1/common/widgets/products/cart/product_carts/add_remove_button.dart';
import 'package:flutter_application_1/common/widgets/texts/product_price_text.dart';
import 'package:flutter_application_1/utills/constants/sizes.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({super.key, this.showaddremovebutton = true});
  final bool showaddremovebutton;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 2,
      separatorBuilder: (_, __) =>
          const SizedBox(height: TSize.spaceBtwSections),
      itemBuilder: (_, index) => Column(
        children: [
          const TCartitem(),
          if (showaddremovebutton) const SizedBox(height: TSize.spaceBtwItems),
          if (showaddremovebutton)
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(width: 70),
                    TProductQualityAddRemove(),
                  ],
                ),
                TProductPriceText(price: '256')
              ],
            )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/styles/shadows/TRoundedContainer.dart';
import 'package:flutter_application_1/common/styles/widget_login_sing_up/success_screen/success_screen.dart';
import 'package:flutter_application_1/common/widgets/appbar/appbar.dart';
import 'package:flutter_application_1/common/widgets/products/cart/Coupon_Widget.dart';
import 'package:flutter_application_1/features/authentication/screens/Home/navigation_menu.dart';
import 'package:flutter_application_1/features/shop/screen/cart/widgets/cart_items.dart';
import 'package:flutter_application_1/features/shop/screen/checkout/widgets/billing_address_section.dart';
import 'package:flutter_application_1/features/shop/screen/checkout/widgets/billing_amount_section.dart';
import 'package:flutter_application_1/features/shop/screen/checkout/widgets/billing_payment_section.dart';
import 'package:flutter_application_1/utills/constants/colors.dart';
import 'package:flutter_application_1/utills/constants/image_string.dart';
import 'package:flutter_application_1/utills/constants/sizes.dart';
import 'package:flutter_application_1/utills/helpers/helper_functions.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Scaffold(
      appBar: TappBar(
          showbackarrow: true,
          title: Text('Order Review',
              style: Theme.of(context).textTheme.headlineSmall)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSize.defaultSpace),
          child: Column(
            children: [
              const TCartItems(showaddremovebutton: false),
              const SizedBox(height: TSize.spaceBtwSections),
              const TCouponCode(),
              const SizedBox(height: TSize.spaceBtwSections),
              TRoundedContainer(
                padding: const EdgeInsets.all(TSize.md),
                showborder: true,
                backgroundcolor: dark ? TColors.black : TColors.textWhite,
                child: const Column(
                  children: [
                    TBillingamountSection(),
                    SizedBox(height: TSize.spaceBtwItems),
                    Divider(),
                    TBillingPaymentSection(),
                    TBillingAdressSection(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSize.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(
                  () => SuccessScreen(
                    image: Timages.successfulpayment,
                    title: 'Payment Success',
                    subtitle: 'Your item will be shipped soon!',
                    onpressed: () => Get.offAll(() => const NavigationMenu()),
                  ),
                ),
            child: const Text("Checkout\$256.0")),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/styles/shadows/TRoundedContainer.dart';
import 'package:flutter_application_1/common/widgets/texts/seaction_heading.dart';
import 'package:flutter_application_1/utills/constants/colors.dart';
import 'package:flutter_application_1/utills/constants/image_string.dart';
import 'package:flutter_application_1/utills/constants/sizes.dart';
import 'package:flutter_application_1/utills/helpers/helper_functions.dart';

class TBillingPaymentSection extends StatelessWidget {
  const TBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Column(
      children: [
        TSectionHeading(
            title: 'Payment Method', buttontitle: 'Change', onpressed: () {}),
        Row(
          children: [
            TRoundedContainer(
              width: 60,
              height: 75,
              backgroundcolor: dark ? TColors.light : TColors.textWhite,
              padding: const EdgeInsets.all(TSize.md),
              child: const Image(
                  image: AssetImage(Timages.paypal), fit: BoxFit.contain),
            ),
            const SizedBox(height: TSize.spaceBtwItems / 2),
            Text('Paypal', style: Theme.of(context).textTheme.bodyLarge),
          ],
        )
      ],
    );
  }
}

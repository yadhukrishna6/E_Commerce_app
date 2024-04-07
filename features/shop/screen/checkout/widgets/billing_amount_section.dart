import 'package:flutter/material.dart';
import 'package:flutter_application_1/utills/constants/sizes.dart';

class TBillingamountSection extends StatelessWidget {
  const TBillingamountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('SubTotal', style: Theme.of(context).textTheme.bodyMedium),
          Text('\$256.0', style: Theme.of(context).textTheme.bodyMedium)
        ],
      ),
      const SizedBox(height: TSize.spaceBtwItems / 2),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Shipping Fee', style: Theme.of(context).textTheme.bodyMedium),
          Text('\$6.0', style: Theme.of(context).textTheme.labelLarge),
        ],
      ),
      const SizedBox(height: TSize.spaceBtwItems / 2),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Tax Fee', style: Theme.of(context).textTheme.bodyMedium),
          Text('\$6.0', style: Theme.of(context).textTheme.labelLarge),
        ],
      ),
      const SizedBox(height: TSize.spaceBtwItems / 2),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Order Total', style: Theme.of(context).textTheme.bodyMedium),
          Text('\$6.0', style: Theme.of(context).textTheme.titleMedium),
        ],
      )
    ]);
  }
}

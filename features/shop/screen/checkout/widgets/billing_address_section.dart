import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/texts/seaction_heading.dart';
import 'package:flutter_application_1/utills/constants/sizes.dart';

class TBillingAdressSection extends StatelessWidget {
  const TBillingAdressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(
            title: 'Shipping Address', buttontitle: 'Change', onpressed: () {}),
        Text('Yadhukrishna .U', style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: TSize.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(Icons.phone, color: Colors.grey, size: 16),
            const SizedBox(width: TSize.spaceBtwItems),
            Text('+92-317-8059525',
                style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
        const SizedBox(height: TSize.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(Icons.location_history, color: Colors.grey, size: 16),
            const SizedBox(width: TSize.spaceBtwItems),
            Text(
              'South Liama,Maine 87695,USA',
              style: Theme.of(context).textTheme.bodyMedium,
              softWrap: true,
            ),
          ],
        ),
      ],
    );
  }
}

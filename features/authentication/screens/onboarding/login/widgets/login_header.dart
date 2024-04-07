import 'package:flutter/material.dart';
import 'package:flutter_application_1/utills/constants/sizes.dart';
import 'package:flutter_application_1/utills/constants/text_string.dart';
import 'package:flutter_application_1/utills/helpers/helper_functions.dart';

import '../../../../../../utills/constants/image_string.dart';

class loginHeader extends StatelessWidget {
  const loginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          height: 90,
          image: AssetImage(dark ? Timages.lightAppLogo : Timages.darkAppLogo),
        ),
        Text(TTexts.loginTitle,
            style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(
          height: TSize.sm,
        ),
        Text(TTexts.loginsubTitle,
            style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}

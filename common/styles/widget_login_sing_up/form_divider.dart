import 'package:flutter/material.dart';
import 'package:flutter_application_1/utills/constants/colors.dart';
import 'package:flutter_application_1/utills/constants/text_string.dart';
import 'package:flutter_application_1/utills/helpers/helper_functions.dart';
import 'package:get/get.dart';

class formDivider extends StatelessWidget {
  const formDivider({
    super.key,
    required this.dividerText,
  });

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            color: dark ? TColors.darkergrey : TColors.grey,
            thickness: 0.5,
            indent: 60,
            endIndent: 5,
          ),
        ),
        Text(TTexts.orSignInwith.capitalize!,
            style: Theme.of(context).textTheme.labelMedium),
        Flexible(
          child: Divider(
            color: dark ? TColors.darkergrey : TColors.grey,
            thickness: 0.5,
            indent: 5,
            endIndent: 60,
          ),
        ),
      ],
    );
  }
}

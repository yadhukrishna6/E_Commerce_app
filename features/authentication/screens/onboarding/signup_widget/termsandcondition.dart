import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/authentication/controllers/signup/signup_controller.dart';
import 'package:flutter_application_1/utills/constants/colors.dart';
import 'package:flutter_application_1/utills/constants/sizes.dart';
import 'package:flutter_application_1/utills/constants/text_string.dart';
import 'package:flutter_application_1/utills/helpers/helper_functions.dart';
import 'package:get/get.dart';

class TTermsandConditionCheckbox extends StatelessWidget {
  const TTermsandConditionCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignUpController.instance;
    final dark = THelperFunction.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(
            () => Checkbox(
              value: controller.privacypolicy.value,
              onChanged: (value) => controller.privacypolicy.value =
                  !controller.privacypolicy.value,
            ),
          ),
        ),
        const SizedBox(
          width: TSize.spaceBtwItems,
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: TTexts.iAgreeTo,
                  style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                  text: ' ${TTexts.privacyPolicy} ',
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: dark ? TColors.textWhite : TColors.primaryColor,
                        decoration: TextDecoration.underline,
                        decorationColor:
                            dark ? TColors.textWhite : TColors.primaryColor,
                      )),
              TextSpan(
                children: [
                  TextSpan(
                      text: TTexts.and,
                      style: Theme.of(context).textTheme.bodySmall),
                  TextSpan(
                      text: ' ${TTexts.termsofuse}',
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                            color:
                                dark ? TColors.textWhite : TColors.primaryColor,
                            decoration: TextDecoration.underline,
                            decorationColor:
                                dark ? TColors.textWhite : TColors.primaryColor,
                          )),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

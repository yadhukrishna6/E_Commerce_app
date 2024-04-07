import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/styles/widget_login_sing_up/form_divider.dart';
import 'package:flutter_application_1/common/styles/widget_login_sing_up/social_buttons.dart';
import 'package:flutter_application_1/features/authentication/screens/onboarding/signup_widget/singupform.dart';
import 'package:flutter_application_1/utills/constants/sizes.dart';
import 'package:flutter_application_1/utills/constants/text_string.dart';
import 'package:flutter_application_1/utills/helpers/helper_functions.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSize.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(TTexts.signupTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: TSize.spaceBtwItems),
              const singupform(),
              const SizedBox(
                height: TSize.spaceBtwItems,
              ),
              formDivider(
                dividerText: TTexts.orSignUpwith.capitalize!,
              ),
              const SizedBox(
                height: TSize.spaceBtwItems,
              ),
              const socialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

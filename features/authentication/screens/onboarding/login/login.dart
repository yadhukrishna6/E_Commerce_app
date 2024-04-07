import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/styles/spacing_style.dart';
import 'package:flutter_application_1/common/styles/widget_login_sing_up/form_divider.dart';
import 'package:flutter_application_1/common/styles/widget_login_sing_up/social_buttons.dart';
import 'package:flutter_application_1/features/authentication/screens/onboarding/login/widgets/login_form.dart';
import 'package:flutter_application_1/features/authentication/screens/onboarding/login/widgets/login_header.dart';

import 'package:flutter_application_1/utills/constants/sizes.dart';
import 'package:flutter_application_1/utills/constants/text_string.dart';

import 'package:flutter_application_1/utills/helpers/helper_functions.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingwithappbarheight,
          child: Column(
            children: [
              loginHeader(),
              loginForm(),
              formDivider(
                dividerText: TTexts.orSignInwith.capitalize!,
              ),
              SizedBox(height: TSize.spaceBtwSections),
              socialButtons()
            ],
          ),
        ),
      ),
    );
  }
}

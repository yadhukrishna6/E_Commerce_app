import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/authentication/controllers/login/login_controller.dart';
import 'package:flutter_application_1/features/authentication/screens/Home/navigation_menu.dart';
import 'package:flutter_application_1/features/authentication/screens/onboarding/signup_widget/signup.dart';
import 'package:flutter_application_1/features/authentication/screens/password_confirguration/forget_password.dart';
import 'package:flutter_application_1/utills/constants/sizes.dart';
import 'package:flutter_application_1/utills/validators/validation.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../utills/constants/text_string.dart';

class loginForm extends StatelessWidget {
  const loginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSize.spaceBtwSections),
        child: Column(
          children: [
            ///email
            TextFormField(
              controller: controller.email,
              validator: (Value) => TValidator.validateEmail(Value),
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: TTexts.email),
            ),
            const SizedBox(
              height: TSize.spaceBtwInputFields,
            ),

            ///pasword
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (Value) => TValidator.validatePassword(Value),
                obscureText: controller.hidepassword.value,
                decoration: InputDecoration(
                  labelText: TTexts.password,
                  prefixIcon: Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    onPressed: () => controller.hidepassword.value =
                        !controller.hidepassword.value,
                    icon: Icon(controller.hidepassword.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: TSize.spaceBtwInputFields / 2,
            ),

            ///rememberme
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: (value) => controller.rememberMe.value =
                              !controller.rememberMe.value),
                    ),
                    const Text(TTexts.rememberMe),
                  ],
                ),
                TextButton(
                    onPressed: () => Get.to(() => const ForgetPassword()),
                    child: const Text(TTexts.forgetPassword)),
              ],
            ),
            const SizedBox(height: TSize.spaceBtwSections),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.emailAndpasswordSignIn(),
                    child: const Text(TTexts.signIn))),
            const SizedBox(height: TSize.spaceBtwItems),
            SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () => Get.to(() => const SignUpScreen()),
                    child: const Text(TTexts.createAccount))),
          ],
        ),
      ),
    );
  }
}

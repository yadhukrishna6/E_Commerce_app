import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/authentication/controllers/signup/signup_controller.dart';
import 'package:flutter_application_1/features/authentication/screens/onboarding/signup_widget/termsandcondition.dart';
import 'package:flutter_application_1/features/authentication/screens/onboarding/signup_widget/verify_email.dart';
import 'package:flutter_application_1/utills/constants/colors.dart';
import 'package:flutter_application_1/utills/constants/sizes.dart';
import 'package:flutter_application_1/utills/constants/text_string.dart';
import 'package:flutter_application_1/utills/validators/validation.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utills/helpers/helper_functions.dart';

class singupform extends StatelessWidget {
  const singupform({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final dark = THelperFunction.isDarkMode(context);
    return Form(
      key: controller.signupformkey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                //first

                child: TextFormField(
                  controller: controller.firstname,
                  validator: (Value) =>
                      TValidator.validateEmptyText('First Name', Value),
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: TTexts.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              const SizedBox(
                width: TSize.spaceBtwInputFields,
              ),

              //lastname

              Expanded(
                child: TextFormField(
                  controller: controller.lastname,
                  validator: (Value) =>
                      TValidator.validateEmptyText('Last Name', Value),
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: TTexts.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: TSize.spaceBtwInputFields,
          ),
          //username
          TextFormField(
            controller: controller.username,
            validator: (Value) =>
                TValidator.validateEmptyText('User Name', Value),
            expands: false,
            decoration: const InputDecoration(
              labelText: TTexts.username,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),
          const SizedBox(
            height: TSize.spaceBtwInputFields,
          ),

          //email

          TextFormField(
            controller: controller.email,
            validator: (Value) => TValidator.validateEmail(Value),
            decoration: const InputDecoration(
              labelText: TTexts.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),
          const SizedBox(
            height: TSize.spaceBtwInputFields,
          ),

          //phonenumber

          TextFormField(
            controller: controller.phonenumber,
            validator: (Value) => TValidator.validatePhoneNumber(Value),
            decoration: const InputDecoration(
              labelText: TTexts.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          const SizedBox(
            height: TSize.spaceBtwInputFields,
          ),

          //password

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
                          : Iconsax.eye))),
            ),
          ),
          const SizedBox(
            height: TSize.spaceBtwInputFields,
          ),
          TTermsandConditionCheckbox(),
          const SizedBox(
            height: TSize.spaceBtwItems,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () => controller.signup(),
                child: const Text(TTexts.createAccount)),
          )
        ],
      ),
    );
  }
}

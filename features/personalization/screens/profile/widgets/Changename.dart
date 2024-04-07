import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/common/widgets/appbar/appbar.dart';
import 'package:flutter_application_1/features/personalization/screens/profile/widgets/updatenamecontroller.dart';
import 'package:flutter_application_1/utills/constants/sizes.dart';
import 'package:flutter_application_1/utills/constants/text_string.dart';
import 'package:flutter_application_1/utills/validators/validation.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameControllers());
    return Scaffold(

        /// Custom Appbar
        appBar: TappBar(
          showbackarrow: true,
          title: Text('Change Name',
              style: Theme.of(context).textTheme.headlineSmall),
        ),
        body: Padding(
            padding: const EdgeInsets.all(TSize.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Headings
                Text(
                  'Use real name for easy verification. This name will appear on several pages.',
                  style: Theme.of(context).textTheme.labelMedium,
                ), // Text
                const SizedBox(height: TSize.spaceBtwSections),

                /// Text field and Button
                Form(
                    key: controller.updateUserNameFormKey,
                    child: Column(children: [
                      TextFormField(
                        controller: controller.firstName,
                        validator: (value) =>
                            TValidator.validateEmptyText('First name', value),
                        expands: false,
                        decoration: const InputDecoration(
                            labelText: TTexts.firstName,
                            prefixIcon: Icon(Iconsax.user)),
                      ),
                      const SizedBox(height: TSize.spaceBtwInputFields),
                      TextFormField(
                        controller: controller.lastName,
                        validator: (value) =>
                            TValidator.validateEmptyText('Last name', value),
                        expands: false,
                        decoration: const InputDecoration(
                            labelText: TTexts.lastName,
                            prefixIcon: Icon(Iconsax.user)),
                      ),
                    ])),
                const SizedBox(height: TSize.spaceBtwSections),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => controller.updateUserName(),
                      child: const Text('Save')),
                ),
              ],
            )));
  }
}

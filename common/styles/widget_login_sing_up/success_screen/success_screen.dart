import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/styles/spacing_style.dart';
import 'package:flutter_application_1/utills/constants/text_string.dart';
import 'package:flutter_application_1/utills/helpers/helper_functions.dart';

import '../../../../utills/constants/sizes.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.onpressed});
  final String image, title, subtitle;
  final VoidCallback onpressed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingwithappbarheight * 2,
          child: Column(
            children: [
              Image(
                image: AssetImage(image),
                width: THelperFunction.screenWidth() * 0.8,
              ),
              const SizedBox(height: TSize.spaceBtwSections),
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSize.spaceBtwItems),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSize.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onpressed,
                  child: const Text(TTexts.Tcontinue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

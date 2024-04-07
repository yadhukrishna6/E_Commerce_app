import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/styles/shadows/TRoundedContainer.dart';
import 'package:flutter_application_1/common/widgets/brands/TBrand.dart';
import 'package:flutter_application_1/utills/constants/colors.dart';
import 'package:flutter_application_1/utills/constants/sizes.dart';
import 'package:flutter_application_1/utills/helpers/helper_functions.dart';

class TBrandShowCase extends StatelessWidget {
  const TBrandShowCase({
    super.key,
    required this.images,
  });
  final List<String> images;
  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showborder: true,
      bordercolor: TColors.darkgrey,
      backgroundcolor: Colors.transparent,
      padding: const EdgeInsets.all(TSize.md),
      margin: const EdgeInsets.only(bottom: TSize.spaceBtwItems),
      child: Column(
        children: [
          const TBrandCard(showBorder: false),
          const SizedBox(
            height: TSize.spaceBtwItems,
          ),
          Row(
            children: images
                .map((image) => brandTopProductionImage(image, context))
                .toList(),
          )
        ],
      ),
    );
  }

  Widget brandTopProductionImage(String image, context) {
    return Expanded(
        child: TRoundedContainer(
      height: 100,
      padding: const EdgeInsets.all(TSize.md),
      margin: const EdgeInsets.only(right: TSize.sm),
      backgroundcolor: THelperFunction.isDarkMode(context)
          ? TColors.darkergrey
          : TColors.light,
      child: Image(fit: BoxFit.contain, image: AssetImage(image)),
    ));
  }
}

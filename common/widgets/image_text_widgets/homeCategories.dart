import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:flutter_application_1/features/shop/screen/sub_Category/sub__category.dart';
import 'package:flutter_application_1/utills/constants/image_string.dart';
import 'package:get/get.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 6,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return TVerticalImageText(
              image: Timages.shoeIcon,
              title: 'Shoes',
              onTap: () => Get.to(() => const SubCategoriesScreen()),
            );
          }),
    );
  }
}

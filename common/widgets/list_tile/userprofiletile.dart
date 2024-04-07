import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/images_slider/TCircular_image.dart';
import 'package:flutter_application_1/features/personalization/controllers/user_controllers.dart';
import 'package:flutter_application_1/utills/constants/colors.dart';
import 'package:flutter_application_1/utills/constants/image_string.dart';
import 'package:iconsax/iconsax.dart';

class TUserProfileTag extends StatelessWidget {
  const TUserProfileTag({
    super.key,
    required this.onpressed,
  });
  final VoidCallback onpressed;
  @override
  Widget build(BuildContext context) {
    final controller = UserControllers.instance;
    return ListTile(
      leading: const Tcircular_image(
          image: Timages.profile, width: 50, height: 50, padding: 0),
      title: Text(controller.user.value.fullName,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: TColors.textWhite)),
      subtitle: Text(controller.user.value.email,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: TColors.textWhite)),
      trailing: IconButton(
        onPressed: onpressed,
        icon: const Icon(Iconsax.edit, color: TColors.textWhite),
      ),
    );
  }
}

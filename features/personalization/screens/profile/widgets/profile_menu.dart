import 'package:flutter/material.dart';
import 'package:flutter_application_1/utills/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class profilemenu extends StatelessWidget {
  const profilemenu({
    super.key,
    this.icon = Iconsax.arrow_right_34,
    required this.onpressed,
    required this.title,
    required this.value,
  });
  final IconData icon;
  final VoidCallback onpressed;
  final String title, value;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSize.spaceBtwItems / 1.5),
        child: Row(
          children: [
            Expanded(
                flex: 3,
                child: Text(title,
                    style: Theme.of(context).textTheme.bodySmall,
                    overflow: TextOverflow.ellipsis)),
            Expanded(
                flex: 5,
                child: Text(value,
                    style: Theme.of(context).textTheme.bodyMedium,
                    overflow: TextOverflow.ellipsis)),
            Expanded(child: Icon(icon, size: 18)),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/utills/constants/enums.dart';

class TBrandTitleText extends StatelessWidget {
  const TBrandTitleText({
    super.key,
    required this.title,
    this.maxlines = 1,
    this.textAlign = TextAlign.center,
    this.brandtextsize = TextSizes.small,
    this.color,
  });
  final String title;
  final int maxlines;
  final Color? color;
  final TextAlign? textAlign;
  final TextSizes brandtextsize;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      maxLines: maxlines,
      overflow: TextOverflow.ellipsis,
      style: brandtextsize == TextSizes.small
          ? Theme.of(context).textTheme.labelMedium!.apply(color: color)
          : brandtextsize == TextSizes.medium
              ? Theme.of(context).textTheme.bodyLarge!.apply(color: color)
              : brandtextsize == TextSizes.large
                  ? Theme.of(context).textTheme.titleLarge!.apply(color: color)
                  : Theme.of(context).textTheme.bodyMedium!.apply(color: color),
    );
  }
}

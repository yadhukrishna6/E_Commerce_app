import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/utills/constants/colors.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

class TRatingbarindicator extends StatelessWidget {
  const TRatingbarindicator({
    super.key,
    required this.rating,
  });
  final double rating;
  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
        rating: rating,
        itemSize: 20,
        unratedColor: TColors.grey,
        itemBuilder: (_, __) =>
            const Icon(Iconsax.star1, color: TColors.primaryColor));
  }
}

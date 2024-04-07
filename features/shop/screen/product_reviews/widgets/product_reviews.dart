import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/appbar/appbar.dart';
import 'package:flutter_application_1/common/widgets/products/ratings/rating_indicator.dart';
import 'package:flutter_application_1/features/shop/screen/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:flutter_application_1/features/shop/screen/product_reviews/widgets/user_review_cart.dart';
import 'package:flutter_application_1/utills/constants/sizes.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TappBar(
        title: Text('Reviews & Ratings'),
        showbackarrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSize.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  'Rating and Reviews are verified and are from people who use the same type of device that you use'),
              const SizedBox(height: TSize.spaceBtwItems),
              const TOverallProductRating(),
              const TRatingbarindicator(rating: 3.5),
              Text('12,611', style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: TSize.spaceBtwSections),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}

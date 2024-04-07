import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/appbar/appbar.dart';
import 'package:flutter_application_1/common/widgets/brands/TBrand.dart';
import 'package:flutter_application_1/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_application_1/common/widgets/products/sortable/sortable.dart';
import 'package:flutter_application_1/common/widgets/texts/seaction_heading.dart';
import 'package:flutter_application_1/features/shop/screen/brands/brand_products.dart';
import 'package:flutter_application_1/utills/constants/sizes.dart';
import 'package:get/get.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TappBar(title: Text('Brands'), showbackarrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSize.defaultSpace),
          child: Column(
            children: [
              const TSectionHeading(
                title: 'Brands',
                showActionButton: false,
              ),
              const SizedBox(height: TSize.spaceBtwItems),
              TGridLayout(
                  itemCount: 10,
                  mainAxisExtent: 70,
                  itemBuilder: (context, index) => TBrandCard(
                        showBorder: true,
                        OnTap: () => Get.to(
                          () => const BrandProducts(),
                        ),
                      ))
            ],
          ),
        ),
      ),
    );
  }
}

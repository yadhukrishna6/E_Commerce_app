import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/authentication/screens/Home/shimmer.dart';
import 'package:flutter_application_1/utills/constants/colors.dart';
import 'package:flutter_application_1/utills/constants/sizes.dart';
import 'package:flutter_application_1/utills/helpers/helper_functions.dart';

class Tcircular_image extends StatelessWidget {
  const Tcircular_image({
    super.key,
    this.width = 56,
    this.height = 56,
    this.padding = TSize.sm,
    required this.image,
    this.backgroundColor,
    this.overlaycolor,
    this.fit = BoxFit.cover,
    this.isnetworkimage = false,
  });
  final double width, height, padding;
  final String image;
  final Color? backgroundColor;
  final Color? overlaycolor;
  final BoxFit? fit;
  final bool isnetworkimage;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: THelperFunction.isDarkMode(context)
            ? TColors.black
            : TColors.textWhite,
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(
          child: isnetworkimage
              ? CachedNetworkImage(
                  fit: fit,
                  color: overlaycolor,
                  imageUrl: image,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      const TshimmerEffect(
                    width: 55,
                    height: 55,
                    radius: 55,
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )
              : Image(
                  fit: fit,
                  image: AssetImage(image) as ImageProvider,
                  color: overlaycolor),
        ),
      ),
    );
  }
}

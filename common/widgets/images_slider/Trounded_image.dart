import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/utills/constants/sizes.dart';


class TRoundedImage extends StatelessWidget {
  const TRoundedImage({
    super.key,
    this.width,
    this.height,
    required this.imageUrl,
    this.applyimageradius = true,
    this.border,
    this.backgroundColor,
    this.fit = BoxFit.contain,
    this.padding,
    this.isnetworkimage = false,
    this.onpressed,
    this.borderradius = TSize.md,
  });
  final double? width, height;
  final String imageUrl;
  final bool applyimageradius;
  final BoxBorder? border;
  final Color? backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isnetworkimage;
  final VoidCallback? onpressed;
  final double borderradius;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
            border: border,
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderradius)),
        child: ClipRRect(
            borderRadius: applyimageradius
                ? BorderRadius.circular(borderradius)
                : BorderRadius.zero,
            child: Image(
              image: isnetworkimage
                  ? NetworkImage(imageUrl)
                  : AssetImage(imageUrl) as ImageProvider,
              fit: fit,
            )),
      ),
    );
  }
}

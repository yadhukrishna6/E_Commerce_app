import 'package:flutter/material.dart';

class TSectionHeading extends StatelessWidget {
  const TSectionHeading(
      {super.key,
      this.textColor,
      this.showActionButton = true,
      required this.title,
      this.buttontitle = 'View all',
      this.onpressed});
  final Color? textColor;
  final bool showActionButton;
  final String title, buttontitle;
  final void Function()? onpressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: textColor),
            maxLines: 1,
            overflow: TextOverflow.ellipsis),
        if (showActionButton)
          TextButton(onPressed: onpressed, child: Text(buttontitle))
      ],
    );
  }
}

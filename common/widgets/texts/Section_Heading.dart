import 'package:flutter/material.dart';

class TSectionHeading extends StatelessWidget {
  const TSectionHeading({
    super.key,
    this.textcolor,
    this.showActionButton = true,
    required this.title,
    this.buttonTitle = 'view all',
    this.onpressed,
  });
  final Color? textcolor;
  final bool showActionButton;
  final String title, buttonTitle;
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
                .apply(color: textcolor),
            maxLines: 1,
            overflow: TextOverflow.ellipsis),
        if (showActionButton)
          TextButton(onPressed: onpressed, child: Text(buttonTitle))
      ],
    );
  }
}

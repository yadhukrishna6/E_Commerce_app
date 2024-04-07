import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/styles/widget_login_sing_up/costome_shapes/container/circle_container.dart';
import 'package:flutter_application_1/utills/constants/colors.dart';
import 'package:flutter_application_1/utills/helpers/helper_functions.dart';

class TChoiceChip extends StatelessWidget {
  const TChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onselected,
  });
  final String text;
  final bool selected;
  final void Function(bool)? onselected;
  @override
  Widget build(BuildContext context) {
    final isColor = THelperFunction.getcolor(text) != null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor ? const SizedBox() : Text(text),
        selected: selected,
        onSelected: onselected,
        labelStyle: TextStyle(color: selected ? TColors.textWhite : null),
        avatar: isColor
            ? TcircleContainer(
                width: 50,
                height: 50,
                backgroundcolor: THelperFunction.getcolor(text)!)
            : null,
        labelPadding: isColor ? const EdgeInsets.all(0) : null,
        padding: isColor ? const EdgeInsets.all(0) : null,
        shape: isColor ? const CircleBorder() : null,
        backgroundColor: isColor ? THelperFunction.getcolor(text)! : null,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/utills/constants/colors.dart';

class TSettingMenuTile extends StatelessWidget {
  const TSettingMenuTile(
      {super.key,
      required this.icon,
      required this.title,
      required this.subtitle,
      this.trailing,
      this.ontap});
  final IconData icon;
  final String title, subtitle;
  final Widget? trailing;
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 28, color: TColors.primaryColor),
      title: Text(title, style: Theme.of(context).textTheme.titleMedium),
      subtitle: Text(subtitle, style: Theme.of(context).textTheme.labelMedium),
      trailing: trailing,
      onTap: ontap,
    );
  }
}

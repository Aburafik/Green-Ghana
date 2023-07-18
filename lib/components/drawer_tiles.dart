import 'package:flutter/material.dart';
import 'package:green_ghana_app/utils/colors.dart';

class DrawerTileComponent extends StatelessWidget {
  const DrawerTileComponent({
    super.key,
    this.title,
    this.icon,
    this.onTap,
  });
  final String? title;
  final IconData? icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon, color: CustomColors.secondaryColor),
        title: Text(
          title!,
          style:
              const TextStyle(color: CustomColors.secondaryColor, fontSize: 16),
        ),
      ),
    );
  }
}

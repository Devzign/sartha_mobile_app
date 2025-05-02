import 'package:flutter/material.dart';
import 'app_color.dart';
import 'custom_text_style.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final Color foregroundColor;

  const CustomAppBar({
    super.key,
    required this.title,
    this.backgroundColor = AppColor.color93287f,
    this.foregroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: CustomTextStyle.style(
          context: context,
          fontSize: 20,
          color: foregroundColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

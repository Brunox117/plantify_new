import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppbar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    return SafeArea(
      child: AppBar(
        title: Center(
          child: Text(
            title,
            style: textStyles.headlineMedium,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize {
    return const Size.fromHeight(55.0);
  }
}
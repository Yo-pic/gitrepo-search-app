import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;

  const CustomAppBar({required this.title});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0.0,
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black.withOpacity(0.85),
        ),
      ),
      backgroundColor: const Color(0xffebf9ff),
    );
  }
}
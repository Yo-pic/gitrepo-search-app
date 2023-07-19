import 'package:flutter/material.dart';

/// Appbarコンポーネント
/// 基本はこのコンポーネントを使用する
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
        style: const TextStyle(
          color: Colors.black54,
        ),
      ),
      iconTheme: const IconThemeData(
        color: Colors.black54,
      ),
      backgroundColor: const Color(0xffebf9ff),
    );
  }
}
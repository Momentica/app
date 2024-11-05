import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:momentica/core/component/momentica_gesture.dart';
import 'package:momentica/core/di/momentica_style.dart';

class MomenticaAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final Widget? title, leading;

  const MomenticaAppBar({
    super.key,
    required this.height,
    this.title,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PreferredSize(
        preferredSize: preferredSize,
        child: AppBar(
          automaticallyImplyLeading: false,
          scrolledUnderElevation: 0,
          titleSpacing: 0,
          centerTitle: true,
          backgroundColor: MomenticaColor.white,
          leading: leading,
          title: title,
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);
}

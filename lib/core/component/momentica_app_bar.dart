import 'package:flutter/material.dart';
import 'package:momentica/core/di/momentica_style.dart';

class MomenticaAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// AppBar 높이
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
          /// 자동적으로 Leading 위젯이 생성되는 것을 방지
          automaticallyImplyLeading: false,

          /// 스크롤할 때 elevation 효과가 나타나는 것을 방지
          scrolledUnderElevation: 0,

          /// title 위젯의 간격 제거
          titleSpacing: 0,

          /// title 위젯 가운데 정렬
          centerTitle: true,

          /// 바탕 색상
          backgroundColor: MomenticaColor.white,
          leading: leading,
          title: title,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}

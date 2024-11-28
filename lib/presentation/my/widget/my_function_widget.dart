import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:momentica/core/component/momentica_gesture.dart';
import 'package:momentica/core/di/momentica_style.dart';
import 'package:momentica/presentation/my/provider/type/my_page_type.dart';

class MyFunctionWidget extends StatelessWidget {
  final MyPageType type;

  const MyFunctionWidget({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return MomenticaGesture(
      event: () => context.push("/my${type.name}"),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: [
            SvgPicture.asset(type.icon),
            const SizedBox(width: 20),
            Text(
              type.caption,
              style: MomenticaTextStyle.label1(
                color: MomenticaColor.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

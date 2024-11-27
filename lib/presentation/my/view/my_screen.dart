import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:momentica/core/component/momentica_app_bar.dart';
import 'package:momentica/core/component/momentica_gesture.dart';
import 'package:momentica/core/di/momentica_style.dart';
import 'package:momentica/core/layout/momentica_layout.dart';
import 'package:momentica/core/type/my/my_type.dart';
import 'package:momentica/presentation/my/widget/my_function_caption_widget.dart';
import 'package:momentica/presentation/my/widget/my_function_widget.dart';

class MyScreen extends StatelessWidget {
  const MyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MomenticaLayout(
      appBar: MomenticaAppBar(
        height: 56,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
          child: Row(
            children: [
              MomenticaGesture(
                event: () => context.pop(),
                child: SvgPicture.asset("$iconCoreAsset/left_arrow_icon.svg"),
              ),
              const SizedBox(width: 8),
              Text(
                "마이페이지",
                style: MomenticaTextStyle.caption1(
                  color: MomenticaColor.black,
                ),
              )
            ],
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MyFunctionCaptionWidget(caption: "정보"),
            /// Spread 연산자 (...) >> 항목들을 나열함.
            /// 아래 코드에선 MyFunctionWidget을 나열할 때 사용함.
            ...List.generate(3, (index) => MyFunctionWidget(type: MyType.values.elementAt(index))),
            const SizedBox(height: 24),
            const MyFunctionCaptionWidget(caption: "도움말"),
            ...List.generate(3, (index) => MyFunctionWidget(type: MyType.values.elementAt(index + 3))),
          ],
        ),
      ),
    );
  }
}

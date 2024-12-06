import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:momentica/core/component/momentica_gesture.dart';
import 'package:momentica/core/di/momentica_style.dart';

class MyUserInfoWidget extends StatelessWidget {
  final Function event;
  final String caption, value;

  const MyUserInfoWidget({
    super.key,
    required this.event,
    required this.caption,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// 제목
        Text(
          caption,
          style: MomenticaTextStyle.label1(
            color: MomenticaColor.black,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 40,
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 1,
                color: MomenticaColor.systemGray200,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// value (initial)
                Text(
                  value,
                  style: MomenticaTextStyle.caption2(
                    color: MomenticaColor.black,
                  ),
                ),

                /// move event
                MomenticaGesture(
                  event: () => event(),
                  child: SvgPicture.asset(
                    "$iconCoreAsset/right_arrow_icon.svg",
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

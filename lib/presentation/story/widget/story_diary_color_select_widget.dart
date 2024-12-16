import 'package:flutter/material.dart';
import 'package:momentica/core/di/momentica_style.dart';
import 'package:momentica/core/type/diary_color_type.dart';

class StoryDiaryColorSelectWidget extends StatelessWidget {
  const StoryDiaryColorSelectWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "일기 색",
          style: MomenticaTextStyle.label1(
            color: MomenticaColor.black,
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 7),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: 32,
              mainAxisSpacing: 20,
              childAspectRatio: 1,
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: DiaryColorType.values.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: DiaryColorType.values.elementAt(index).color,
                  shape: BoxShape.circle,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

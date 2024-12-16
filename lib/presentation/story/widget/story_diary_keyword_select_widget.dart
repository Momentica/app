import 'package:flutter/material.dart';
import 'package:momentica/core/di/momentica_style.dart';

class StoryDiaryKeywordSelectWidget extends StatelessWidget {
  const StoryDiaryKeywordSelectWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "이야기 키워드",
          style: MomenticaTextStyle.label1(
            color: MomenticaColor.black,
          ),
        ),
        const SizedBox(height: 12),
        /// Select Chips
        Wrap(
          direction: Axis.horizontal,
          // 나열 방향
          alignment: WrapAlignment.start,
          // 정렬 방식
          spacing: 8,
          // 좌우 간격
          runSpacing: 8,
          // 상하 간격
          children: [
            for (int i = 0; i < 10; i++)
              FittedBox(
                child: Container(
                  decoration: BoxDecoration(
                    color: MomenticaColor.systemGray50,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: Text(
                      ",,",
                      style: MomenticaTextStyle.body2(
                        color: MomenticaColor.black,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}

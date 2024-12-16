import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:momentica/core/di/momentica_style.dart';

class StoryDiaryPreviewWidget extends StatelessWidget {
  const StoryDiaryPreviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "일기 책",
          style: MomenticaTextStyle.label1(
            color: MomenticaColor.black,
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 12),
          child: FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  "$diaryTickAsset/red_tick_diary.svg",
                  width: 92,
                  height: 132,
                ),
                const SizedBox(width: 32),
                SvgPicture.asset(
                  "$diaryPhotoAsset/red_photo_diary.svg",
                  width: 92,
                  height: 132,
                ),
                const SizedBox(width: 32),
                SvgPicture.asset(
                  "$diaryBookmarkAsset/red_bookmark_diary.svg",
                  width: 92,
                  height: 132,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

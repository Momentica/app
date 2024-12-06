import 'package:momentica/core/di/momentica_style.dart';

enum OnBoardingTabType {
  main(
    offset: -1,
    image: "$imageOnBoardingAsset/on_boarding_main_image.png",
  ),
  moment(
    offset: 0,
    image: "$imageOnBoardingAsset/on_boarding_moment_image.png",
  ),
  story(
    offset: 1,
    image: "$imageOnBoardingAsset/on_boarding_story_image.png",
  );

  final double offset;
  final String image;

  const OnBoardingTabType({
    required this.offset,
    required this.image,
  });
}

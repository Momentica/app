import 'package:momentica/core/di/momentica_style.dart';

enum MyPageType {
  user(
    icon: "$iconMyAsset/user_icon.svg",
    caption: "내 정보",
  ),
  address(
    icon: "$iconMyAsset/home_icon.svg",
    caption: "배송지",
  ),
  order(
    icon: "$iconMyAsset/widget_icon.svg",
    caption: "주문 내역",
  ),
  question(
    icon: "$iconMyAsset/question_box_icon.svg",
    caption: "자주 묻는 질문",
  ),
  counselor(
    icon: "$iconMyAsset/counselor_icon.svg",
    caption: "고객센터",
  ),
  terms(
    icon: "$iconMyAsset/board_icon.svg",
    caption: "서비스 이용약관",
  );

  final String icon, caption;

  const MyPageType({
    required this.icon,
    required this.caption,
  });
}

import 'package:flutter/material.dart';
import 'package:momentica/presentation/my/widget/counselor/tab/my_counselor_detail_tab.dart';
import 'package:momentica/presentation/my/widget/counselor/tab/my_counselor_inquiry_tab.dart';

enum CounselorTabType {
  inquiry(
    offset: -1,
    caption: "문의하기",
    tab: MyCounselorInquiryTab(),
  ),
  detail(
    offset: 1,
    caption: "문의 내역 보기",
    tab: MyCounselorDetailTab(),
  );

  final double offset;
  final String caption;
  final Widget tab;

  const CounselorTabType({
    required this.offset,
    required this.caption,
    required this.tab,
  });
}

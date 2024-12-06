import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:momentica/core/component/momentica_button.dart';
import 'package:momentica/core/component/momentica_text_field.dart';
import 'package:momentica/core/di/momentica_style.dart';
import 'package:momentica/core/type/suffix_type.dart';

class MyCounselorInquiryTab extends StatefulWidget {
  const MyCounselorInquiryTab({super.key});

  @override
  State<MyCounselorInquiryTab> createState() => _MyCounselorInquiryTabState();
}

class _MyCounselorInquiryTabState extends State<MyCounselorInquiryTab> {
  late TextEditingController inquiryController;
  late FocusNode inquiryFocusNode;

  @override
  void initState() {
    super.initState();
    inquiryController = TextEditingController();
    inquiryFocusNode = FocusNode();
  }

  @override
  void dispose() {
    inquiryController.dispose();
    inquiryFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          MomenticaTextField(
            controller: inquiryController,
            focusNode: inquiryFocusNode,
            height: 148,
            maxLength: 500,
            maxLines: 100,
            counter: true,
            type: SuffixType.none,
            caption: "문의 내용",
            hintText: "문의하실 내용을 500자 내로 작성해주세요.",
          ),
          const SizedBox(height: 40),
          Text(
            "참고 사진",
            style: MomenticaTextStyle.label1(
              color: MomenticaColor.black,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: 100,
            height: 100,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: MomenticaColor.systemGray50,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: MomenticaColor.systemGray300,
                width: 1,
                strokeAlign: BorderSide.strokeAlignInside,
              ),
            ),
            child: SvgPicture.asset(
              "$iconCoreAsset/outlined_gallery_icon.svg",
              width: 28,
              height: 28,
            ),
          ),
          const Spacer(),
          MomenticaButton(
            event: () {},
            backgroundColor: MomenticaColor.systemGray300,
            content: Text(
              "문의하기",
              style: MomenticaTextStyle.button1(
                color: MomenticaColor.white,
              ),
            ),
            height: 52,
            radius: 8,
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}

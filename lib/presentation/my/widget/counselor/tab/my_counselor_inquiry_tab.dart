import 'package:flutter/material.dart';
import 'package:momentica/core/component/momentica_text_field.dart';
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
        ],
      ),
    );
  }
}

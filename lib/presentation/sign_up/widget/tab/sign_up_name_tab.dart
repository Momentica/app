import 'package:flutter/material.dart';
import 'package:momentica/core/component/momentica_text_field.dart';
import 'package:momentica/core/di/momentica_style.dart';
import 'package:momentica/core/type/suffix_type.dart';

class SignUpNameTab extends StatefulWidget {
  const SignUpNameTab({super.key});

  @override
  State<SignUpNameTab> createState() => _SignUpNameTabState();
}

class _SignUpNameTabState extends State<SignUpNameTab> {
  late TextEditingController nameController;
  late FocusNode nameFocusNode;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    nameFocusNode = FocusNode();
  }

  // @override
  // void dispose() {
  //   nameController.dispose();
  //   nameFocusNode.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Text(
            "이름을\n입력해주세요",
            style: MomenticaTextStyle.title3(
              color: MomenticaColor.black,
            ),
          ),
          const SizedBox(height: 40),
          MomenticaTextField(
            controller: nameController,
            focusNode: nameFocusNode,
            caption: "이름",
            hintText: "본명을 입력해주세요.",
            type: SuffixType.eraser,
            textInputAction: TextInputAction.done,
          ),
        ],
      ),
    );
  }
}

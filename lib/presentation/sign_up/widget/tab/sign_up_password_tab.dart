import 'package:flutter/material.dart';
import 'package:momentica/core/component/momentica_text_field.dart';
import 'package:momentica/core/di/momentica_style.dart';
import 'package:momentica/core/layout/momentica_layout.dart';
import 'package:momentica/core/type/suffix_type.dart';

class SignUpPasswordTab extends StatefulWidget {
  const SignUpPasswordTab({super.key});

  @override
  State<SignUpPasswordTab> createState() => _SignUpPasswordTabState();
}

class _SignUpPasswordTabState extends State<SignUpPasswordTab> {
  late TextEditingController passwordController;
  late TextEditingController confirmController;

  late FocusNode passwordFocusNode;
  late FocusNode confirmFocusNode;

  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
    confirmController = TextEditingController();

    passwordFocusNode = FocusNode();
    confirmFocusNode = FocusNode();
  }

  // @override
  // void dispose() {
  //   passwordController.dispose();
  //   confirmController.dispose();
  //
  //   passwordFocusNode.dispose();
  //   confirmFocusNode.dispose();
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
            "비밀번호를\n입력해주세요",
            style: MomenticaTextStyle.title3(
              color: MomenticaColor.black,
            ),
          ),
          const SizedBox(height: 40),
          MomenticaTextField(
            controller: passwordController,
            focusNode: passwordFocusNode,
            caption: "비밀번호",
            type: SuffixType.password,
          ),
          const SizedBox(height: 32),
          MomenticaTextField(
            controller: confirmController,
            focusNode: confirmFocusNode,
            caption: "비밀번호 확인",
            type: SuffixType.password,
          ),
        ],
      ),
    );
  }
}

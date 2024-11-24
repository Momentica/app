import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:momentica/core/component/momentica_button.dart';
import 'package:momentica/core/component/momentica_text_field.dart';
import 'package:momentica/core/di/momentica_style.dart';
import 'package:momentica/core/layout/momentica_layout.dart';
import 'package:momentica/core/type/suffix_type.dart';
import 'package:momentica/core/util/number_formatter.dart';
import 'package:momentica/presentation/sign_in/widget/sign_in_account_action_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late TextEditingController phoneController;
  late TextEditingController passwordController;

  late FocusNode phoneFocusNode;
  late FocusNode passwordFocusNode;

  @override
  void initState() {
    super.initState();
    phoneController = TextEditingController();
    passwordController = TextEditingController();

    phoneFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();

    phoneFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MomenticaLayout(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Text(
                "로그인하고\n모멘티카를 사용해보세요!",
                style: MomenticaTextStyle.title3(
                  color: MomenticaColor.black,
                ),
              ),
              const SizedBox(height: 44),
              MomenticaTextField(
                controller: phoneController,
                focusNode: phoneFocusNode,
                caption: "전화번호",
                type: SuffixType.eraser,
                textInputType: TextInputType.phone,
                textInputFormatter: NumberFormatter(),
              ),
              const SizedBox(height: 32),
              MomenticaTextField(
                controller: passwordController,
                focusNode: passwordFocusNode,
                caption: "비밀번호",
                type: SuffixType.password,
              ),
              const SizedBox(height: 52),
              MomenticaButton(
                event: () {},
                backgroundColor: MomenticaColor.main,
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "로그인 하기",
                      style: MomenticaTextStyle.button1(
                        color: MomenticaColor.white,
                      ),
                    ),
                    const SizedBox(width: 4),
                    SvgPicture.asset(
                        "$iconCoreAsset/rightwards_arrow_icon.svg"),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              const SignInAccountActionWidget(),
              SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
            ],
          ),
        ),
      ),
    );
  }
}

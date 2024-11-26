import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:momentica/core/component/momentica_button.dart';
import 'package:momentica/core/component/momentica_text_field.dart';
import 'package:momentica/core/di/momentica_style.dart';
import 'package:momentica/core/layout/momentica_layout.dart';
import 'package:momentica/core/provider/text_field_empty_provider.dart';
import 'package:momentica/core/type/suffix_type.dart';
import 'package:momentica/core/util/number_formatter.dart';
import 'package:momentica/presentation/sign_in/widget/sign_in_account_action_widget.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  late TextEditingController phoneController;
  late TextEditingController passwordController;

  late FocusNode phoneFocusNode;
  late FocusNode passwordFocusNode;

  @override
  void initState() {
    super.initState();
    phoneController = TextEditingController()..addListener(_onChanged);
    passwordController = TextEditingController()..addListener(_onChanged);

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

  /// TextField의 값이 NotEmpty인지 Check하고, Value Update
  void _onChanged() {
    final changeEmptyValue = ref.read(textFieldEmptyProvider.notifier);

    if (phoneController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      changeEmptyValue.state = true;
    } else {
      changeEmptyValue.state = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final emptyValue = ref.watch(textFieldEmptyProvider);
    return MomenticaLayout(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),

              /// Title
              Text(
                "로그인하고\n모멘티카를 사용해보세요!",
                style: MomenticaTextStyle.title3(
                  color: MomenticaColor.black,
                ),
              ),
              const SizedBox(height: 44),

              /// TextFields
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

              /// Login Action Button
              MomenticaButton(
                event: () {
                  if (emptyValue) {
                    context.go("/main");
                  }
                },
                height: 52,
                radius: 8,
                backgroundColor: !emptyValue
                    ? MomenticaColor.systemGray300
                    : MomenticaColor.main,
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

              /// Etc.. Action Button
              const SignInAccountActionWidget(),

              /// KeyBoard가 올라왔을 때 화면을 Scroll 할 수 있도록 간격 부여
              SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
            ],
          ),
        ),
      ),
    );
  }
}

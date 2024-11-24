import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:momentica/core/component/momentica_app_bar.dart';
import 'package:momentica/core/component/momentica_button.dart';
import 'package:momentica/core/component/momentica_gesture.dart';
import 'package:momentica/core/di/momentica_style.dart';
import 'package:momentica/core/layout/momentica_layout.dart';
import 'package:momentica/core/provider/text_field_focus_provider.dart';
import 'package:momentica/presentation/sign_up/provider/sign_up_page_controller_provider.dart';
import 'package:momentica/presentation/sign_up/provider/type/sign_up_page_type.dart';
import 'package:momentica/presentation/sign_up/widget/sign_up_agree_personal_info_bottom_sheet.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// page 관리
    final tabIndex = ref.watch(signUpPageControllerProvider);
    final updateTabIndex = ref.read(signUpPageControllerProvider.notifier);

    /// text field 관리
    final focusValue = ref.watch(textFieldFocusProvider);
    return MomenticaLayout(
      appBar: MomenticaAppBar(
        height: 32,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MomenticaGesture(
                event: () {
                  if (_controller.index == 0) {
                    context.pop();
                  } else {
                    _controller.animateTo(_controller.index - 1);
                    updateTabIndex.animate(index: _controller.index);
                  }
                },
                child: SvgPicture.asset("$iconCoreAsset/left_arrow_icon.svg"),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: (_controller.index + 1).toString(),
                      style: MomenticaTextStyle.subTitle1(
                        color: MomenticaColor.systemGray900,
                      ),
                    ),
                    TextSpan(
                      text: "/3",
                      style: MomenticaTextStyle.subTitle1(
                        color: MomenticaColor.systemGray700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Padding(
          padding: EdgeInsets.only(top: 24, bottom: focusValue ? 0 : 12),
          child: MomenticaButton(
            event: () {
              if (_controller.index == 2) {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: MomenticaColor.white,
                  builder: (context) {
                    return const SignUpAgreePersonalInfoBottomSheet();
                  },
                );
              } else {
                _controller.animateTo(_controller.index + 1);
                updateTabIndex.animate(index: _controller.index);
              }
            },
            backgroundColor: MomenticaColor.main,
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "다음",
                  style: MomenticaTextStyle.button1(
                    color: MomenticaColor.white,
                  ),
                ),
                const SizedBox(width: 4),
                SvgPicture.asset("$iconCoreAsset/rightwards_arrow_icon.svg"),
              ],
            ),
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 4),

          /// 탭바 애니메이션
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Container(
              height: 4,
              width: MediaQuery.of(context).size.width,
              color: MomenticaColor.systemGray100,
              child: Align(
                alignment: Alignment.centerLeft,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  height: 4,
                  width: MediaQuery.of(context).size.width /
                      3 *
                      (tabIndex.index + 1),
                  decoration: const BoxDecoration(
                    color: MomenticaColor.systemGray900,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                ),
              ),
            ),
          ),

          /// TabController를 사용하였기에 TabBarView로 화면 표시
          Expanded(
            child: TabBarView(
              controller: _controller,
              physics: const NeverScrollableScrollPhysics(),
              children: SignUpPageType.values.map((type) => type.tab).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

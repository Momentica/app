import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:momentica/core/component/momentica_button.dart';
import 'package:momentica/core/di/momentica_style.dart';
import 'package:momentica/core/layout/momentica_layout.dart';
import 'package:momentica/presentation/on_boarding/provider/type/on_boarding_tab_type.dart';
import 'package:momentica/presentation/on_boarding/widget/on_boarding_tab_switch.dart';
import 'package:momentica/presentation/on_boarding/widget/tab/on_boarding_tab.dart';

class OnBoardingScreen extends ConsumerStatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  ConsumerState<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends ConsumerState<OnBoardingScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        TabController(length: OnBoardingTabType.values.length, vsync: this);
    _controller.animation!.addListener(() {
      int index = _controller.index + _controller.offset.round();

      setState(() {
        _controller.index = index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MomenticaLayout(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Padding(
          padding: const EdgeInsets.only(top: 24, bottom: 12),
          child: MomenticaButton(
            event: () => context.go("/signIn"),
            height: 52,
            radius: 8,
            backgroundColor: MomenticaColor.main,
            content: Text(
              "시작하기",
              style: MomenticaTextStyle.button1(
                color: MomenticaColor.white,
              ),
            ),
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 32),
          OnBoardingTabSwitch(controller: _controller),
          const SizedBox(height: 40),
          Expanded(
            child: TabBarView(
              controller: _controller,
              children: OnBoardingTabType.values
                  .map((type) => OnBoardingTab(type: type))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:momentica/core/component/momentica_button.dart';
import 'package:momentica/core/component/momentica_gesture.dart';
import 'package:momentica/core/di/momentica_router.dart';
import 'package:momentica/core/di/momentica_style.dart';
import 'package:momentica/core/layout/momentica_layout.dart';
import 'package:momentica/presentation/on_boarding/provider/type/on_boarding_page_type.dart';
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
        TabController(length: OnBoardingPageType.values.length, vsync: this);
    _controller.animation!.addListener(() {
      int index = _controller.index + _controller.offset.round();

      setState(() {
        _controller.index = index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    const double size = 8;
    return MomenticaLayout(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Padding(
          padding: const EdgeInsets.only(top: 24, bottom: 12),
          child: MomenticaButton(
            event: () => context.go("/signIn"),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              OnBoardingPageType.values.length,
              (index) {
                return MomenticaGesture(
                  event: () {
                    if (_controller.index != index) {
                      _controller.index = index;
                    }
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    width: size,
                    height: size,
                    decoration: BoxDecoration(
                      color: _controller.index == index
                          ? MomenticaColor.systemGray900
                          : MomenticaColor.systemGray100,
                      shape: BoxShape.circle,
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 40),
          Expanded(
            child: TabBarView(
              controller: _controller,
              children: OnBoardingPageType.values.map((type) => OnBoardingTab(type: type)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

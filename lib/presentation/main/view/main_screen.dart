import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:momentica/core/component/momentica_app_bar.dart';
import 'package:momentica/core/component/momentica_gesture.dart';
import 'package:momentica/core/di/momentica_style.dart';
import 'package:momentica/core/layout/momentica_layout.dart';
import 'package:momentica/presentation/main/widget/main_app_bar_my_toggle.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MomenticaLayout(
      appBar: MomenticaAppBar(
        height: 58,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Image.asset(
                "$imageCoreAsset/momentica_logo_image.png",
                width: 140,
                height: 24,
              ),
            ),
            Row(
              children: [
                MomenticaGesture(
                  event: () => context.push("/storyAdd"),
                  child: SvgPicture.asset("$iconCoreAsset/add_icon.svg"),
                ),
                const SizedBox(width: 20),
                MomenticaGesture(
                  event: () => context.push("/my"),
                  child: const MainAppBarMyToggle(),
                ),
              ],
            ),
          ],
        ),
      ),
      child: const Column(
        children: [],
      ),
    );
  }
}

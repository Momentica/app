import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:momentica/core/component/momentica_app_bar.dart';
import 'package:momentica/core/component/momentica_gesture.dart';
import 'package:momentica/core/di/momentica_style.dart';
import 'package:momentica/core/layout/momentica_layout.dart';
import 'package:momentica/presentation/my/provider/type/counselor_tab_type.dart';
import 'package:momentica/presentation/my/widget/counselor/my_counselor_tab_switch.dart';

class MyCounselorScreen extends StatefulWidget {
  const MyCounselorScreen({super.key});

  @override
  State<MyCounselorScreen> createState() => _MyCounselorScreenState();
}

class _MyCounselorScreenState extends State<MyCounselorScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        TabController(length: CounselorTabType.values.length, vsync: this);
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
      resizeToAvoidBottomInset: false,
      appBar: MomenticaAppBar(
        height: 56,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
          child: Row(
            children: [
              MomenticaGesture(
                event: () => context.pop(),
                child: SvgPicture.asset("$iconCoreAsset/left_arrow_icon.svg"),
              ),
              const SizedBox(width: 8),
              Text(
                "고객센터",
                style: MomenticaTextStyle.caption1(
                  color: MomenticaColor.black,
                ),
              )
            ],
          ),
        ),
      ),
      child: Column(
        children: [
          MyCounselorTabSwitch(controller: _controller),
          Expanded(
            child: TabBarView(
              controller: _controller,
              children: CounselorTabType.values.map((type) => type.tab).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

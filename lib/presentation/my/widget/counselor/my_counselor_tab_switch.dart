import 'package:flutter/material.dart';
import 'package:momentica/core/component/momentica_gesture.dart';
import 'package:momentica/core/di/momentica_style.dart';
import 'package:momentica/presentation/my/provider/type/counselor_tab_type.dart';

class MyCounselorTabSwitch extends StatelessWidget {
  final TabController controller;

  const MyCounselorTabSwitch({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Stack(
        children: [
          AnimatedAlign(
            alignment: Alignment(
                CounselorTabType.values.elementAt(controller.index).offset, 0),
            duration: const Duration(milliseconds: 200),
            child: Container(
              width: MediaQuery.of(context).size.width / 2,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 2,
                    color: MomenticaColor.main,
                    strokeAlign: BorderSide.strokeAlignInside,
                  ),
                ),
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: CounselorTabType.values.length,
            itemBuilder: (context, index) {
              return MomenticaGesture(
                event: () {
                  if (controller.index != index) {
                    controller.index = index;
                  }
                },
                child: Align(
                  alignment: Alignment(
                      CounselorTabType.values.elementAt(index).offset, 0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Center(
                      child: Text(
                        CounselorTabType.values.elementAt(index).caption,
                        style: MomenticaTextStyle.body1(
                          color: MomenticaColor.black,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

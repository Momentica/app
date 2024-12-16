import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:momentica/core/component/momentica_gesture.dart';
import 'package:momentica/core/di/momentica_style.dart';

class MyOrderDetailCustomerInfoWidget extends StatefulWidget {
  const MyOrderDetailCustomerInfoWidget({super.key});

  @override
  State<MyOrderDetailCustomerInfoWidget> createState() => _MyOrderDetailCustomerInfoWidgetState();
}

class _MyOrderDetailCustomerInfoWidgetState extends State<MyOrderDetailCustomerInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: MomenticaColor.systemGray100,
            strokeAlign: BorderSide.strokeAlignInside,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "주문자 정보",
                  style: MomenticaTextStyle.button1(
                    color: MomenticaColor.black,
                  ),
                ),
                MomenticaGesture(
                  event: () {},
                  child: SvgPicture.asset(
                    "$iconCoreAsset/bottom_arrow_icon.svg",
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  "강해민",
                  style: MomenticaTextStyle.caption3(
                    color: MomenticaColor.systemGray900,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  "010-5656-2523",
                  style: MomenticaTextStyle.caption3(
                    color: MomenticaColor.systemGray900,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

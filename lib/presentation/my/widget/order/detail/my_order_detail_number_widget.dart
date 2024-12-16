import 'package:flutter/material.dart';
import 'package:momentica/core/di/momentica_style.dart';

class MyOrderDetailNumberWidget extends StatelessWidget {
  const MyOrderDetailNumberWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: MomenticaColor.systemGray100,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "주문 번호 : 6738291023",
              style: MomenticaTextStyle.button1(
                color: MomenticaColor.black,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "결제 날짜 : 2024. 09. 09 10:53",
              style: MomenticaTextStyle.caption3(
                color: MomenticaColor.systemGray600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

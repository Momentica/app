import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:momentica/core/component/momentica_app_bar.dart';
import 'package:momentica/core/component/momentica_gesture.dart';
import 'package:momentica/core/di/momentica_style.dart';
import 'package:momentica/core/layout/momentica_layout.dart';
import 'package:momentica/presentation/my/widget/order/detail/my_order_detail_customer_info_widget.dart';
import 'package:momentica/presentation/my/widget/order/detail/my_order_detail_main_info_widget.dart';
import 'package:momentica/presentation/my/widget/order/detail/my_order_detail_number_widget.dart';

class MyOrderDetailScreen extends StatelessWidget {
  const MyOrderDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MomenticaLayout(
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
                "주문 상세 내역",
                style: MomenticaTextStyle.caption1(
                  color: MomenticaColor.black,
                ),
              )
            ],
          ),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyOrderDetailNumberWidget(),
            SizedBox(height: 16),
            MyOrderDetailMainInfoWidget(),
            SizedBox(height: 16),
            MyOrderDetailCustomerInfoWidget(),
            SizedBox(height: 16),
            MyOrderDetailCustomerInfoWidget(),
          ],
        ),
      ),
    );
  }
}

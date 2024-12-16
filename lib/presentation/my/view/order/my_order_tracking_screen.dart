import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:momentica/core/component/momentica_app_bar.dart';
import 'package:momentica/core/component/momentica_gesture.dart';
import 'package:momentica/core/di/momentica_style.dart';
import 'package:momentica/core/layout/momentica_layout.dart';
import 'package:momentica/presentation/my/widget/order/tracking/my_order_tracking_delivery_info_widget.dart';
import 'package:momentica/presentation/my/widget/order/tracking/my_order_tracking_info_widget.dart';
import 'package:momentica/presentation/my/widget/order/tracking/my_order_tracking_product_info_widget.dart';

class MyOrderTrackingScreen extends StatelessWidget {
  const MyOrderTrackingScreen({super.key});

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
                "배송 조회하기",
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
            /// 배송 현황
            MyOrderTrackingInfoWidget(),
            SizedBox(height: 12),
            /// 베송 상품 정보
            MyOrderTrackingProductInfoWidget(),
            SizedBox(height: 12),
            /// 배송 정보
            MyOrderTrackingDeliveryInfoWidget(),
          ],
        ),
      ),
    );
  }
}

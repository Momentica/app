import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:momentica/core/component/momentica_app_bar.dart';
import 'package:momentica/core/component/momentica_button.dart';
import 'package:momentica/core/component/momentica_gesture.dart';
import 'package:momentica/core/component/momentica_text_field.dart';
import 'package:momentica/core/di/momentica_style.dart';
import 'package:momentica/core/layout/momentica_layout.dart';
import 'package:momentica/core/provider/text_field_focus_provider.dart';
import 'package:momentica/core/type/suffix_type.dart';
import 'package:momentica/core/util/number_formatter.dart';

class MyAddressEditScreen extends ConsumerStatefulWidget {
  const MyAddressEditScreen({super.key});

  @override
  ConsumerState<MyAddressEditScreen> createState() => _MyAddressEditScreenState();
}

class _MyAddressEditScreenState extends ConsumerState<MyAddressEditScreen> {
  late TextEditingController nameController;
  late TextEditingController postcodeController;
  late TextEditingController addressController;
  late TextEditingController detailAddressController;
  late TextEditingController phoneController;

  late FocusNode nameFocusNode;
  late FocusNode postcodeFocusNode;
  late FocusNode addressFocusNode;
  late FocusNode detailAddressFocusNode;
  late FocusNode phoneFocusNode;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    postcodeController = TextEditingController();
    addressController = TextEditingController();
    detailAddressController = TextEditingController();
    phoneController = TextEditingController();

    nameFocusNode = FocusNode();
    postcodeFocusNode = FocusNode();
    addressFocusNode = FocusNode();
    detailAddressFocusNode = FocusNode();
    phoneFocusNode = FocusNode();
  }

  @override
  void dispose() {
    nameController.dispose();
    postcodeController.dispose();
    addressController.dispose();
    detailAddressController.dispose();
    phoneController.dispose();

    nameFocusNode.dispose();
    postcodeFocusNode.dispose();
    addressFocusNode.dispose();
    detailAddressFocusNode.dispose();
    phoneFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final focusValue = ref.watch(textFieldFocusProvider);
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
                "배송지 수정",
                style: MomenticaTextStyle.caption1(
                  color: MomenticaColor.black,
                ),
              )
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
            event: () {},
            height: 52,
            radius: 8,
            backgroundColor: MomenticaColor.main,
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "완료",
                  style: MomenticaTextStyle.button1(
                    color: MomenticaColor.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              /// 주문자 이름 입력
              MomenticaTextField(
                controller: nameController,
                focusNode: nameFocusNode,
                hintText: "이름",
                type: SuffixType.none,
              ),
              const SizedBox(height: 24),

              /// 주문자 우편번호 입력
              MomenticaTextField(
                controller: postcodeController,
                focusNode: postcodeFocusNode,
                hintText: "우편번호",
                type: SuffixType.none,
                buttonContent: "우편번호 검색",
                buttonEvent: () {},
                buttonWidth: 90,
              ),
              const SizedBox(height: 24),

              /// 주소 입력
              MomenticaTextField(
                controller: addressController,
                focusNode: addressFocusNode,
                hintText: "주소",
                type: SuffixType.none,
              ),
              const SizedBox(height: 24),

              /// 상세 주소 입력
              MomenticaTextField(
                controller: detailAddressController,
                focusNode: detailAddressFocusNode,
                hintText: "상세 주소",
                type: SuffixType.none,
              ),
              const SizedBox(height: 24),

              /// 주문자 전화번호 입력
              MomenticaTextField(
                controller: phoneController,
                focusNode: phoneFocusNode,
                hintText: "전화번호",
                type: SuffixType.none,
                textInputType: TextInputType.number,
                textInputAction: TextInputAction.done,
                textInputFormatter: NumberFormatter(),
              ),
              SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
            ],
          ),
        ),
      ),
    );
  }
}

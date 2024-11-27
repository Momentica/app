import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momentica/core/component/momentica_button.dart';
import 'package:momentica/core/component/momentica_gesture.dart';
import 'package:momentica/core/di/momentica_style.dart';
import 'package:flutter_svg/svg.dart';
import 'package:momentica/core/provider/text_field_focus_provider.dart';
import 'package:momentica/core/type/suffix_type.dart';

class MomenticaTextField extends ConsumerStatefulWidget {
  final TextEditingController controller;

  final FocusNode focusNode;

  /// 텍스트 필드 타이틀
  final String caption;

  final String? hintText, buttonContent;

  final bool? autofocus;

  final Widget? suffixIcon;

  /// 버튼 이벤트
  final Function? buttonEvent;

  final int? maxLength;

  final TextInputAction? textInputAction;

  final TextInputType? textInputType;

  final TextInputFormatter? textInputFormatter;

  final SuffixType type;

  const MomenticaTextField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.caption,
    required this.type,
    this.hintText,
    this.autofocus = false,
    this.buttonContent,
    this.buttonEvent,
    this.suffixIcon,
    this.maxLength,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.textInputFormatter,
  });

  @override
  ConsumerState<MomenticaTextField> createState() => _MomenticaTextFieldState();
}

class _MomenticaTextFieldState extends ConsumerState<MomenticaTextField> {
  bool _isClicked = false;

  @override
  Widget build(BuildContext context) {
    final updateFocus = ref.read(textFieldFocusProvider.notifier);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.caption,
          style: MomenticaTextStyle.label1(
            color: MomenticaColor.black,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: TextField(
                controller: widget.controller,
                focusNode: widget.focusNode,
                style: MomenticaTextStyle.caption2(
                  color: MomenticaColor.black,
                ),

                autofocus: widget.autofocus!,

                inputFormatters: widget.textInputFormatter != null
                    ? [widget.textInputFormatter!]
                    : [],

                maxLength: widget.maxLength,

                obscureText: widget.type == SuffixType.password && !_isClicked
                    ? true
                    : false,

                cursorWidth: 1,

                keyboardType: widget.textInputType,

                textInputAction: widget.textInputAction,

                decoration: InputDecoration(
                  /// placeholder >> 기본값
                  hintText: widget.hintText ?? "placeholder",
                  hintStyle: MomenticaTextStyle.caption2(
                    color: MomenticaColor.systemGray300,
                  ),


                  filled: true,
                  fillColor: MomenticaColor.systemGray50,

                  contentPadding: const EdgeInsets.symmetric(horizontal: 12),

                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),

                  /// suffixIcon -> custom 및 다양한 Icon
                  suffixIcon: switch (widget.type) {
                    SuffixType.none => null,
                    SuffixType.eraser => MomenticaGesture(
                        event: () => widget.controller.clear(),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          child: SvgPicture.asset(
                            "$iconCoreAsset/circle_close_icon.svg",
                          ),
                        ),
                      ),
                    SuffixType.password => MomenticaGesture(
                        event: () {
                          setState(() {
                            _isClicked = !_isClicked;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          child: SvgPicture.asset(
                            "$iconCoreAsset/eyes_${_isClicked ? "open" : "close"}_icon.svg",
                          ),
                        ),
                      ),
                    SuffixType.custom => widget.suffixIcon,
                  },

                  /// 텍스트 필드가 포커스 되었을 때
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: MomenticaColor.main,
                      strokeAlign: BorderSide.strokeAlignInside,
                      width: 1,
                    ),
                  ),

                  /// 텍스트 필드가 포커스 되지 않았을 때
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: MomenticaColor.systemGray50,
                      strokeAlign: BorderSide.strokeAlignInside,
                      width: 1,
                    ),
                  ),
                ),

                onChanged: (value) {
                  setState(() {});
                },

                onTap: () {
                  if (FocusScope.of(context).hasFocus) {
                    updateFocus.state = false;
                    FocusScope.of(context).unfocus();
                  } else {
                    updateFocus.state = true;
                    FocusScope.of(context).hasFocus;
                  }
                },

                /// 바깥 영역을 클릭 시 포커스 해제
                onTapOutside: (event) {
                  updateFocus.state = false;
                  FocusScope.of(context).unfocus();
                },
              ),
            ),
            if (widget.buttonContent != null && widget.buttonEvent != null)
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: MomenticaButton(
                  width: 80,
                  height: 48,
                  event: () => widget.buttonEvent!(),
                  radius: 12,
                  backgroundColor: widget.controller.text.isEmpty
                      ? MomenticaColor.systemGray100
                      : MomenticaColor.main,
                  content: Text(
                    widget.buttonContent!,
                    style: MomenticaTextStyle.button2(
                      color: widget.controller.text.isEmpty
                          ? MomenticaColor.systemGray400
                          : MomenticaColor.white,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}

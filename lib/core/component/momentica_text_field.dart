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

  final double? width, height, radius, buttonWidth, buttonRadius;

  /// 제목, 힌트, 버튼의 내용
  final String? caption, hintText, buttonContent;

  /// 버튼 이벤트
  final Function? buttonEvent;

  /// 자동 포커싱
  final bool? autofocus, counter;

  final Widget? suffixIcon;

  final int? maxLength, maxLines;

  final TextInputAction? textInputAction;

  final TextInputType? textInputType;

  final TextInputFormatter? textInputFormatter;

  final SuffixType type;

  const MomenticaTextField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.type,
    this.height,
    this.width,
    this.buttonWidth,
    this.caption,
    this.hintText,
    this.buttonContent,
    this.autofocus = false,
    this.counter = false,
    this.suffixIcon,
    this.maxLength,
    this.maxLines = 1,
    this.radius = 12,
    this.buttonRadius = 12,
    this.buttonEvent,
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
        /// 제목이 없는 경우도 존재함.
        if (widget.caption != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.caption!,
                  style: MomenticaTextStyle.label1(
                    color: MomenticaColor.black,
                  ),
                ),
                if (widget.counter! && widget.maxLength != null)
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: widget.controller.text.length.toString(),
                          style: MomenticaTextStyle.caption3(
                            color: MomenticaColor.black,
                          ),
                        ),
                        TextSpan(
                          text: "/${widget.maxLength}",
                          style: MomenticaTextStyle.caption3(
                            color: MomenticaColor.systemGray500,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: widget.height ?? 48,
                width: widget.width ?? MediaQuery.of(context).size.width,
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

                  maxLines: widget.maxLines,

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

                    counterText: "",

                    filled: true,
                    fillColor: MomenticaColor.systemGray50,

                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 16),

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
                      borderRadius: BorderRadius.circular(widget.radius!),
                      borderSide: const BorderSide(
                        color: MomenticaColor.main,
                        strokeAlign: BorderSide.strokeAlignInside,
                        width: 1,
                      ),
                    ),

                    /// 텍스트 필드가 포커스 되지 않았을 때
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(widget.radius!),
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
            ),
            if (widget.buttonContent != null && widget.buttonEvent != null)
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: MomenticaButton(
                  width: widget.buttonWidth ?? 80,
                  height: widget.height ?? 48,
                  event: () => widget.buttonEvent!(),
                  radius: widget.buttonRadius ?? 12,
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

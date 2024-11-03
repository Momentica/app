import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:momentica/core/component/momentica_gesture.dart';
import 'package:momentica/core/di/momentica_asset.dart';
import 'package:momentica/core/di/momentica_style.dart';
import 'package:flutter_svg/svg.dart';
import 'package:momentica/core/type/suffix_type.dart';

class MomenticaTextField extends StatefulWidget {
  final TextEditingController controller;

  final FocusNode focusNode;

  final String caption;

  final String? hintText;

  final bool? autofocus;

  final Widget? suffixIcon;

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
    this.suffixIcon,
    this.maxLength,
    this.textInputAction,
    this.textInputType,
    this.textInputFormatter,
  });

  @override
  State<MomenticaTextField> createState() => _MomenticaTextFieldState();
}

class _MomenticaTextFieldState extends State<MomenticaTextField> {
  bool _isClicked = false;

  @override
  Widget build(BuildContext context) {
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
        TextField(
          controller: widget.controller,
          focusNode: widget.focusNode,
          style: MomenticaTextStyle.caption1(
            color: MomenticaColor.black,
          ),

          autofocus: widget.autofocus!,

          maxLength: widget.maxLength,

          obscureText:
              widget.type == SuffixType.password && !_isClicked ? true : false,

          cursorWidth: 1,

          decoration: InputDecoration(
            hintText: widget.hintText ?? "placeholder",
            hintStyle: MomenticaTextStyle.caption1(
              color: MomenticaColor.systemGray300,
            ),

            filled: true,
            fillColor: MomenticaColor.systemGray50,

            contentPadding: const EdgeInsets.symmetric(horizontal: 12),

            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),

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

          onTap: () {
            /// 텍스트 필드가 포커스 된 상태에서 텍스트 필드를 클릭하면 포커스 해제
            FocusScope.of(context).hasFocus
                ? FocusScope.of(context).unfocus()
                : FocusScope.of(context).hasFocus;
          },

          /// 바깥 영역을 클릭 시 포커스 해제
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },
        ),
      ],
    );
  }
}

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
import 'package:momentica/presentation/story/widget/story_diary_color_select_widget.dart';
import 'package:momentica/presentation/story/widget/story_diary_keyword_select_widget.dart';
import 'package:momentica/presentation/story/widget/story_diary_preview_widget.dart';

class StoryAddScreen extends ConsumerStatefulWidget {
  const StoryAddScreen({super.key});

  @override
  ConsumerState<StoryAddScreen> createState() => _StoryAddScreenState();
}

class _StoryAddScreenState extends ConsumerState<StoryAddScreen> {
  late TextEditingController titleController;
  late TextEditingController deadlineController;
  late TextEditingController partnerController;
  late TextEditingController nameController;

  late FocusNode titleFocusNode;
  late FocusNode deadlineFocusNode;
  late FocusNode partnerFocusNode;
  late FocusNode nameFocusNode;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    deadlineController = TextEditingController();
    partnerController = TextEditingController();
    nameController = TextEditingController();

    titleFocusNode = FocusNode();
    deadlineFocusNode = FocusNode();
    partnerFocusNode = FocusNode();
    nameFocusNode = FocusNode();
  }

  @override
  void dispose() {
    titleController.dispose();
    deadlineController.dispose();
    partnerController.dispose();
    nameController.dispose();

    titleFocusNode.dispose();
    deadlineFocusNode.dispose();
    partnerFocusNode.dispose();
    nameFocusNode.dispose();
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
          child: Align(
            alignment: Alignment.centerLeft,
            child: MomenticaGesture(
              event: () {
                context.pop();
              },
              child: SvgPicture.asset("$iconCoreAsset/left_arrow_icon.svg"),
            ),
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
            content: Text(
              "이야기 만들기",
              style: MomenticaTextStyle.button1(
                color: MomenticaColor.white,
              ),
            ),
          ),
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Text(
                "새로운 이야기를\n만들어 보세요!",
                style: MomenticaTextStyle.title3(
                  color: MomenticaColor.black,
                ),
              ),
              const SizedBox(height: 32),
              MomenticaTextField(
                controller: titleController,
                focusNode: titleFocusNode,
                caption: "이야기 제목",
                hintText: "만들어 갈 이야기의 제목을 입력해주세요.",
                type: SuffixType.eraser,
              ),
              const SizedBox(height: 28),
              MomenticaTextField(
                controller: deadlineController,
                focusNode: deadlineFocusNode,
                caption: "이야기 마감일",
                hintText: "이야기의 마감일을 선택해주세요.",
                type: SuffixType.none,
              ),
              const SizedBox(height: 28),
              MomenticaTextField(
                controller: partnerController,
                focusNode: partnerFocusNode,
                caption: "함께하는 사람",
                hintText: "ex.) 사랑하는 00이",
                type: SuffixType.eraser,
              ),
              const SizedBox(height: 28),
              MomenticaTextField(
                controller: nameController,
                focusNode: nameFocusNode,
                caption: "필명",
                hintText: "ex.) 너를 좋아하는 00이",
                type: SuffixType.eraser,
              ),
              const SizedBox(height: 28),
              const StoryDiaryColorSelectWidget(),
              const SizedBox(height: 28),
              const StoryDiaryPreviewWidget(),
              const SizedBox(height: 28),
              const StoryDiaryKeywordSelectWidget(),

              /// FAB을 고려한 간격
              const SizedBox(height: 104),

              /// 키보드가 올라왔을 때 화면을 스크롤 하기 위한 간격
              SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
            ],
          ),
        ),
      ),
    );
  }
}

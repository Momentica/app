import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momentica/presentation/sign_up/provider/type/sign_up_agree_option_type.dart';

class SignUpAgreeOptionController extends StateNotifier<List<SignUpAgreeOptionType>> {
  SignUpAgreeOptionController() : super(List.empty());

  void allAgree() {
    state = SignUpAgreeOptionType.values.toList();
  }

  void delAllAgree() {
    state = List.empty();
  }

  void addAgree({required SignUpAgreeOptionType option}) {
    state = [...state, option];
  }

  void delAgree({required SignUpAgreeOptionType option}) {
    state = state.where((item) => item != option).toList();
  }
}

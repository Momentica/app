import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momentica/presentation/sign_up/provider/type/sign_up_page_type.dart';

class SignUpPageController extends StateNotifier<SignUpPageType> {
  SignUpPageController() : super(SignUpPageType.name);

  void animate({required int index}) {
    state = SignUpPageType.values.elementAt(index);
  }
}

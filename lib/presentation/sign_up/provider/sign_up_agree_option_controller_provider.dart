import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momentica/presentation/sign_up/provider/controller/sign_up_agree_option_controller.dart';
import 'package:momentica/presentation/sign_up/provider/type/sign_up_agree_option_type.dart';

final signUpAgreeOptionControllerProvider = StateNotifierProvider<SignUpAgreeOptionController, List<SignUpAgreeOptionType>>(
  (ref) => SignUpAgreeOptionController(),
);

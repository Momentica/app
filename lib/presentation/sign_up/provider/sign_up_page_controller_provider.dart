import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momentica/presentation/sign_up/provider/controller/sign_up_page_controller.dart';
import 'package:momentica/presentation/sign_up/provider/type/sign_up_page_type.dart';

final signUpPageControllerProvider =
    StateNotifierProvider<SignUpPageController, SignUpPageType>(
        (ref) => SignUpPageController());

import 'package:flutter/material.dart';
import 'package:momentica/presentation/sign_up/view/sign_up_name_screen.dart';
import 'package:momentica/presentation/sign_up/view/sign_up_password_screen.dart';
import 'package:momentica/presentation/sign_up/view/sign_up_phone_screen.dart';

enum SignUpPageType {
  name(page: SignUpNameScreen()),
  phone(page: SignUpPhoneScreen()),
  password(page: SignUpPasswordScreen());

  final Widget page;

  const SignUpPageType({
    required this.page,
  });
}

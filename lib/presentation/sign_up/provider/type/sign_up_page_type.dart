import 'package:flutter/material.dart';
import 'package:momentica/presentation/sign_up/widget/sign_up_name_tab.dart';
import 'package:momentica/presentation/sign_up/widget/sign_up_password_tab.dart';
import 'package:momentica/presentation/sign_up/widget/sign_up_phone_tab.dart';

enum SignUpPageType {
  name(page: SignUpNameTab()),
  phone(page: SignUpPhoneTab()),
  password(page: SignUpPasswordTab());

  final Widget page;

  const SignUpPageType({
    required this.page,
  });
}

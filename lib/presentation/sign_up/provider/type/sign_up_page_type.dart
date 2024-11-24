import 'package:flutter/material.dart';
import 'package:momentica/presentation/sign_up/widget/tab/sign_up_name_tab.dart';
import 'package:momentica/presentation/sign_up/widget/tab/sign_up_password_tab.dart';
import 'package:momentica/presentation/sign_up/widget/tab/sign_up_phone_tab.dart';

enum SignUpPageType {
  name(tab: SignUpNameTab()),
  phone(tab: SignUpPhoneTab()),
  password(tab: SignUpPasswordTab());

  final Widget tab;

  const SignUpPageType({
    required this.tab,
  });
}

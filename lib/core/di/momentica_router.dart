import 'package:go_router/go_router.dart';
import 'package:momentica/presentation/main/view/main_screen.dart';
import 'package:momentica/presentation/my/view/address/my_address_edit_screen.dart';
import 'package:momentica/presentation/my/view/address/my_address_screen.dart';
import 'package:momentica/presentation/my/view/counselor/my_counselor_screen.dart';
import 'package:momentica/presentation/my/view/order/my_order_screen.dart';
import 'package:momentica/presentation/my/view/question/my_question_screen.dart';
import 'package:momentica/presentation/my/view/my_screen.dart';
import 'package:momentica/presentation/my/view/my_terms_screen.dart';
import 'package:momentica/presentation/my/view/user/my_user_edit_name_screen.dart';
import 'package:momentica/presentation/my/view/user/my_user_edit_password_screen.dart';
import 'package:momentica/presentation/my/view/user/my_user_edit_phone_screen.dart';
import 'package:momentica/presentation/my/view/user/my_user_screen.dart';
import 'package:momentica/presentation/on_boarding/view/on_boarding_screen.dart';
import 'package:momentica/presentation/password/view/password_reset_screen.dart';
import 'package:momentica/presentation/sign_in/view/sign_in_screen.dart';
import 'package:momentica/presentation/sign_up/view/sign_up_screen.dart';
import 'package:momentica/presentation/sign_up/view/sign_up_success_screen.dart';
import 'package:momentica/presentation/splash/view/splash_screen.dart';

final GoRouter momenticaRouter = GoRouter(
  initialLocation: "/splash",
  routes: [
    /// Splash
    GoRoute(
      path: "/splash",
      builder: (context, state) {
        return const SplashScreen();
      },
    ),

    /// OnBoarding
    GoRoute(
      path: "/onBoarding",
      builder: (context, state) {
        return const OnBoardingScreen();
      },
    ),

    /// Auth
    GoRoute(
      path: "/signIn",
      builder: (context, state) {
        return const SignInScreen();
      },
    ),
    GoRoute(
      path: "/signUp",
      builder: (context, state) {
        return const SignUpScreen();
      },
    ),
    GoRoute(
      path: "/signUpSuccess",
      builder: (context, state) {
        return const SignUpSuccessScreen();
      },
    ),
    GoRoute(
      path: "/password",
      builder: (context, state) {
        return const PasswordResetScreen();
      },
    ),

    /// Main
    GoRoute(
      path: "/main",
      builder: (context, state) {
        return const MainScreen();
      },
    ),

    /// My
    GoRoute(
      path: "/my",
      builder: (context, state) {
        return const MyScreen();
      },
    ),

    /// MyUser
    GoRoute(
      path: "/myUser",
      builder: (context, state) {
        return const MyUserScreen();
      },
    ),
    GoRoute(
      path: "/myUserEditName",
      builder: (context, state) {
        return const MyUserEditNameScreen();
      },
    ),
    GoRoute(
      path: "/myUserEditPhone",
      builder: (context, state) {
        return const MyUserEditPhoneScreen();
      },
    ),
    GoRoute(
      path: "/myUserEditPassword",
      builder: (context, state) {
        return const MyUserEditPasswordScreen();
      },
    ),

    /// MyAddress
    GoRoute(
      path: "/myAddress",
      builder: (context, state) {
        return const MyAddressScreen();
      },
    ),
    GoRoute(
      path: "/myAddressEdit",
      builder: (context, state) {
        return const MyAddressEditScreen();
      },
    ),
    GoRoute(
      path: "/myOrder",
      builder: (context, state) {
        return const MyOrderScreen();
      },
    ),
    GoRoute(
      path: "/myQuestion",
      builder: (context, state) {
        return const MyQuestionScreen();
      },
    ),
    GoRoute(
      path: "/myCounselor",
      builder: (context, state) {
        return const MyCounselorScreen();
      },
    ),
    GoRoute(
      path: "/myTerms",
      builder: (context, state) {
        return const MyTermsScreen();
      },
    ),
  ],
);

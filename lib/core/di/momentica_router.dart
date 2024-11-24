import 'package:go_router/go_router.dart';
import 'package:momentica/presentation/main/view/main_screen.dart';
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
  ],
);

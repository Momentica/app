import 'package:go_router/go_router.dart';
import 'package:momentica/presentation/sign_in/view/sign_in_screen.dart';
import 'package:momentica/presentation/sign_up/view/sign_up_screen.dart';
import 'package:momentica/presentation/splash/view/splash_screen.dart';

final GoRouter momenticaRouter = GoRouter(
  initialLocation: "/splash",
  routes: [
    GoRoute(
      path: "/splash",
      builder: (context, state) {
        return const SplashScreen();
      },
    ),
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
  ],
);

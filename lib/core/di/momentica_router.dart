import 'package:go_router/go_router.dart';
import 'package:momentica/presentation/sign_in/view/sign_in_screen.dart';

final GoRouter momenticaRouter = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: "/signIn",
      builder: (context, state) {
        return const SignInScreen();
      },
    ),
  ],
);

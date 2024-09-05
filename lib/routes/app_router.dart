part of 'routes.dart';

GoRouter appRouter([String? location]) => GoRouter(
      initialLocation: location ?? AppRoute.registerPage.path,
      debugLogDiagnostics: kDebugMode,
      routes: [
        GoRoute(
          path: AppRoute.registerPage.path,
          name: AppRoute.registerPage.name,
          builder: (context, state) => const RegisterPage(),
        ),
        GoRoute(
          path: AppRoute.loginPage.path,
          name: AppRoute.loginPage.name,
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          path: AppRoute.homePage.path,
          name: AppRoute.homePage.name,
          builder: (context, state) => const HomePage(),
        ),
      ],
    );

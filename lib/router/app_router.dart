import 'package:go_router/go_router.dart';
import 'package:personal_intro/presentation/home_page.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
      routes: [
        // Hash-style deep links scroll to sections on the single page.
        // go_router handles these as sub-routes that resolve to the same page,
        // passing the section fragment via the state's extra field.
        GoRoute(
          path: 'about',
          builder: (context, state) => const HomePage(section: 'about'),
        ),
        GoRoute(
          path: 'experience',
          builder: (context, state) => const HomePage(section: 'experience'),
        ),
        GoRoute(
          path: 'expertise',
          builder: (context, state) => const HomePage(section: 'expertise'),
        ),
        GoRoute(
          path: 'projects',
          builder: (context, state) => const HomePage(section: 'projects'),
        ),
        GoRoute(
          path: 'open-source',
          builder: (context, state) =>
              const HomePage(section: 'open-source'),
        ),
        GoRoute(
          path: 'contact',
          builder: (context, state) => const HomePage(section: 'contact'),
        ),
      ],
    ),
  ],
);

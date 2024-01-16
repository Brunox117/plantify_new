import 'package:go_router/go_router.dart';
import 'package:plantify/presentation/screens/screens.dart';
import 'package:plantify/presentation/views/views.dart';


final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
     StatefulShellRoute.indexedStack(
        builder: (_, __, navigationShell) => HomeScreen(
              currentChild: navigationShell,
            ),
        branches: <StatefulShellBranch>[
          StatefulShellBranch(routes: [
            GoRoute(
              path: '/',
              builder: (context, state) {
                return const HomeView();
              },
            )
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: '/create-plant',
              builder: (context, state) {
                return const CreatePlantView();
              },
            )
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: '/configuration',
              builder: (context, state) {
                return const ConfigView();
              },
            ),
          ]),
        ])
  ]
);
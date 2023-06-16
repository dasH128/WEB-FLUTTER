import 'package:go_router/go_router.dart';
import 'package:sistema_web/src/screens/screen.dart';

final appRouter = GoRouter(
  initialLocation: '/dashboard',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) {
        return const LoginScreen();
      },
    ),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) {
        return const HomeScreen();
      },
      routes: [
        GoRoute(
          path: 'usuarios',
          builder: (context, state) {
            return const UsersScreen();
          },
        ),
        GoRoute(
          path: 'trabajadores',
          builder: (context, state) {
            return const WorkersScreen();
          },
        ),
        GoRoute(
          path: 'trabajadores-crear',
          builder: (context, state) {
            return const WorkerAddScreen();
          },
        ),
        GoRoute(
          path: 'programaciones',
          builder: (context, state) {
            return const ProgramationsScreen();
          },
        ),
        GoRoute(
          path: 'islas',
          builder: (context, state) {
            return const IslandsScreen();
          },
        ),
        GoRoute(
          path: 'islas-crear',
          builder: (context, state) {
            return const IslandAddScreen();
          },
        ),
        GoRoute(
          path: 'planificaciones',
          builder: (context, state) {
            return const PlanningScreen();
          },
        ),
        GoRoute(
          path: 'gestiones',
          builder: (context, state) {
            return const GestionsScreen();
          },
        ),
      ],
    ),
  ],
);

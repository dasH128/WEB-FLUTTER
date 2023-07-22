import 'package:go_router/go_router.dart';
import 'package:sistema_web/src/entities/entities.dart';
import 'package:sistema_web/src/screens/screen.dart';

final appRouter = GoRouter(
  initialLocation: '/login',
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
          path: 'trabajadores-editar',
          builder: (context, state) {
            return WorkerEditScreen(
              worker: (state.extra as WorkerEntity),
            );
          },
        ),
        GoRoute(
          path: 'programacion-crear',
          builder: (context, state) {
            return ProgramationAddScreen(
                planning: (state.extra as PlanningEntity));
          },
        ),
        GoRoute(
          path: 'programacion-grafica',
          builder: (context, state) {
            return ProgramationDashboardScreen(
                planning: (state.extra as PlanningEntity));
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
          path: 'planificacion-crear',
          builder: (context, state) {
            return const PlanningAddScreen();
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
    GoRoute(path: '/menu-user',
      builder: (context, state) {
        return const MenuUserScreen();
      },
      routes: [

      ]
      )
  ],
);

import 'package:add_with_hive/screens/todo/list.dart';
import 'package:add_with_hive/screens/todo/new.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const ListTodoScreen(),
      routes: [
        GoRoute(
          path: 'new',
          builder: (context, state) => const NewTodoScreen(),
        )
      ]
    )
  ]
);

/// 사용예
// final GoRouter appRouter = GoRouter(
//   initialLocation: '/login',
//   routes: [
//     GoRoute(
//       path: '/login',
//       builder: (context, state) => const LoginScreen(),
//     ),
//     GoRoute(
//       path: '/catalog',
//       builder: (context, state) => const CatalogScreen(),
//       routes: [
//         GoRoute(
//           path: 'cart',
//           builder: (context, state) => const CartScreen(),
//         )
//       ]
//     )
//   ]
// );
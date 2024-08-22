import 'package:crud/controllers/update_users.dart';
import 'package:crud/views/add_users.dart';
import 'package:crud/views/read_users.dart';
import 'package:go_router/go_router.dart';

final routes = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const AddUsers(),
    ),
    GoRoute(
      path: '/lista',
      builder: (context, state) => const ReadUsers(),
    ),
    GoRoute(
      path: '/update',
      builder: (context, state) => const UpdateUsers(),
    )
  ],
);

import 'package:go_router/go_router.dart';
import '../main.dart';
import 'routes.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/',
  redirect: (context, state) {
    final user = authRepo.currentUser;
    if (user == null) {
      // necessary or navitagion will skip splash screen
      if (state.fullPath == '/') return null;
      return '/login';
    } else {
      if (state.fullPath == '/' || state.fullPath == '/login') {
        return '/profile';
      }
      return null; // return "null" to display the intended route without redirecting
    }
  },
  routes: $appRoutes,
);

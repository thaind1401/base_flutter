import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../../app.dart';

@Injectable()
class RouteGuard extends AutoRouteGuard {
  RouteGuard(this._isLoggedInUseCase);

  final IsLoggedInUseCase _isLoggedInUseCase;

  Future<bool> _isLoggedIn() async {
    try {
      final output = await _isLoggedInUseCase.execute(const IsLoggedInInput());
      return output.isLoggedIn;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<void> onNavigation(NavigationResolver resolver, StackRouter router) async {
    final isLoggedIn = await _isLoggedIn();
    if (isLoggedIn) {
      resolver.next(true);
    } else {
      await router.push(const LoginRoute());
      resolver.next(false);
    }
  }
}

import 'package:app/route/api_route.dart';
import 'package:vania/vania.dart';

class RouteServiceProvider extends ServiceProvider {
  @override
  Future<void> boot() async {}

  @override
  Future<void> register() async {
    ApiRoute().register();
  }
}

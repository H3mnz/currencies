import 'package:app/app/http/controllers/home_controller.dart';
import 'package:vania/vania.dart';

class ApiRoute implements Route {
  @override
  void register() {
    Router().basePrefix('api');
    Router.get("/currencies", homeController.index);
  }
}

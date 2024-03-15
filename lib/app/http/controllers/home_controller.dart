import 'dart:convert';
import 'dart:io';

import 'package:app/app/repository/products_repository.dart';
import 'package:vania/vania.dart';

class HomeController extends Controller {
  final cache = Cache();
  //
  Future<Response> index(Request request) async {
    final listCache = await cache.get('list');
    if (listCache != null) {
      return Response.json(
        {
          'message': 'ok',
          'list': jsonDecode(listCache),
        },
      );
    }
    final list = await ProductsRepository.fetch();
    if (list == null) {
      return Response.json({'message': 'notFound'}, HttpStatus.notFound);
    }
    cache.put('list', jsonEncode(list), duration: Duration(days: 1));
    return Response.json(
      {
        'message': 'ok',
        'list': list,
      },
    );
  }
}

final HomeController homeController = HomeController();

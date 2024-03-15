import 'dart:convert';
import 'dart:io';

import 'package:app/app/helper/scraper_helper.dart';
import 'package:app/app/repository/products_repository.dart';
import 'package:vania/vania.dart';

class HomeController extends Controller {
  //
  Future<Response> index(Request request) async {
    final cache = Cache();
    final listCache = await cache.get('list');
    if (listCache != null) {
      print('using cached list');
      return Response.json(
        {
          'message': 'ok',
          'list': jsonDecode(listCache),
        },
      );
    }
    final html = await ProductsRepository().fetch();
    if (html == null) {
      return Response.json({'message': 'notFound'}, HttpStatus.notFound);
    }
    final list = ScraperHelper.parseData(html);
    if (list == null) {
      return Response.json({'message': 'notFound'}, HttpStatus.notFound);
    }
    print('list cached');
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

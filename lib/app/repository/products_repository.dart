import 'package:app/app/helper/scraper_helper.dart';
import 'package:http/http.dart' as http;

import '../../config/utils.dart';

const String _baseUrl = 'https://www.tgju.org/currency';

class ProductsRepository {
  ProductsRepository._();
  static Future<List<Map<String, dynamic>>?> fetch() async {
    try {
      var response = await http.get(Uri.parse(_baseUrl), headers: headers);
      if (response.statusCode == 200) {
        return ScraperHelper.parseData(response.body);
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}

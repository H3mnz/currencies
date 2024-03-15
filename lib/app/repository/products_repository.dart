import 'package:http/http.dart' as http;

import '../../config/utils.dart';

const String _baseUrl = 'https://www.tgju.org/currency';

class ProductsRepository {
  Future<String?> fetch() async {
    try {
      var response = await http.get(Uri.parse(_baseUrl), headers: headers);
      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}

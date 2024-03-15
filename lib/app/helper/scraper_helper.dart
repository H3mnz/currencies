import 'package:beautiful_soup_dart/beautiful_soup.dart';

class ScraperHelper {
  ScraperHelper._();

  static List<Map<String, dynamic>> parseData(String html) {
    try {
      // print(html);
      final soup = BeautifulSoup(html);

      final tables = soup.findAll('table', class_: 'data-table market-table');
      final list = <Map<String, dynamic>>[];
      for (var table in tables) {
        final items = table.find('tbody')?.findAll('tr');
        if (items == null) continue;
        for (var element in items) {
          final name = element.find('th')?.text;
          final country = element.find('th')?.find('span')?.classes.last.split('-').last;
          final tds = element.findAll('td');
          final price = tds[0].text;
          final min = tds[2].text;
          final max = tds[3].text;
          final date = tds[4].text;

          if (name == null || country == null) continue;
          final map = {
            'name': name,
            'country': country,
            'price': price,
            'min': min,
            'max': max,
            'date': date,
          };
          list.add(map);
        }
      }
      return list;
    } catch (e) {
      print('ScraperHelper parseData : $e');
    }
    return [];
  }
}

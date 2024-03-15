import 'package:app/app/providers/route_service_povider.dart';
import 'package:vania/vania.dart';

import 'cros.dart';

Map<String, dynamic> config = {
  'name': 'app',
  'key': 'A1RPS_ry7G9YuyZP56aEIDv7uvSvoXuyMx4DZhCPq5Q=',
  'port': 8800,
  'host': '0.0.0.0',
  'debug': true,
  'url': '',
  'timezone': '',
  'websocket': false,
  'cros': cros,
  'database': null, //databaseConfig,
  'cache': CacheConfig(),
  'auth': '',
  'storage': FileStorageConfig(),
  'providers': <ServiceProvider>[
    RouteServiceProvider(),
  ],
};

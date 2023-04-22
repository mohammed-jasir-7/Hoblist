import 'package:geeks/injectable.config.dart';
import 'package:get_it/get_it.dart';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;
@InjectableInit()
Future<void> configureInjection() async {
  getIt.init(
    environment: Environment.prod,
  );
}

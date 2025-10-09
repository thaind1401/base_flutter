import 'package:get_it/get_it.dart';
import 'package:objectbox/objectbox.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared/shared.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repository/source/database/generated/objectbox.g.dart' show getObjectBoxModel;

final GetIt getIt = GetIt.instance;

void configureInjection() async {
  // Register SharedPreferences
  getIt.registerSingletonAsync<SharedPreferences>(() => SharedPreferences.getInstance());
  
  // Register ObjectBox Store
  getIt.registerSingletonAsync<Store>(() async {
    final dir = await getApplicationDocumentsDirectory();
    return Store(getObjectBoxModel(), directory: '${dir.path}/${DatabaseConstants.databaseName}');
  });
  
  // Wait for async dependencies
  await getIt.allReady();
}

import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:ii_test/core/data_source/user_remote_data_source/user_remote_data_source.dart';
import 'package:ii_test/core/data_source/user_remote_data_source/user_remote_data_source_impl.dart';
import 'package:ii_test/core/services/user_service.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:ii_test/core/services/http/http_service.dart';
import 'package:ii_test/core/services/http/http_service_impl.dart';
import 'package:ii_test/core/utils/exports.dart';

GetIt locator = GetIt.instance;
Future<void> setupLocator({bool test = false})async {
  Directory appDocDir = test ? Directory.current : await getApplicationDocumentsDirectory();
  Hive.init(appDocDir.path);

  if(!test) {
    locator.registerLazySingleton<HiveInterface>(() => Hive);
  }

  locator.registerLazySingleton<NavigationService>(
    () => NavigationService()
  );
  locator.registerLazySingleton<HttpService>(
    () => HttpServiceImpl()
  );
  locator.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl()
  );
  locator.registerLazySingleton<UserService>(
    () => UserService()
  );

  await UserService().init();
}
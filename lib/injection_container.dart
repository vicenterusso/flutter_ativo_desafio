import 'package:get_it/get_it.dart';

import 'package:flutter_ativo/features/home/data/datasources/dashboard_remote_datasource.dart';
import 'package:flutter_ativo/features/home/data/repositories/dashboard_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // DATA SOURCES
  sl.registerLazySingleton(() => DashboardRemoteDataSource());

  // REPOSITORIES

  sl.registerLazySingleton(() => DashboardRepository(sl()));
  // sl.registerLazySingleton(() => AuthRepositoryImp(sl(), sl()));
  // sl.registerLazySingleton(() => RegisterRepositoryImp(sl(), sl()));
  // sl.registerLazySingleton(() => ClienteRepositoryImp(sl(), sl()));
}

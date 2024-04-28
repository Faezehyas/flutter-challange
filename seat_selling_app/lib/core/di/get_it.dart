import 'package:get_it/get_it.dart';
import 'package:seat_selling_app/core/utils/request.dart';
import 'package:seat_selling_app/data/repository/remote/auth_repository_impl.dart';
import 'package:seat_selling_app/data/repository/remote/stadium_repository_impl.dart';
import 'package:seat_selling_app/data/source/mock/auth_mock.dart';
import 'package:seat_selling_app/data/source/mock/stadium_mock.dart';
import 'package:seat_selling_app/data/source/remote/auth_data_source.dart';
import 'package:seat_selling_app/data/source/remote/stadium_data_source.dart';
import 'package:seat_selling_app/domain/repository/auth_repository.dart';
import 'package:seat_selling_app/domain/repository/stadium_repository.dart';
import 'package:seat_selling_app/domain/usecase/auth_usecase.dart';
import 'package:seat_selling_app/domain/usecase/stadium_usecase.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  getIt.registerSingleton<Request>(Request());

  getIt.registerFactory<AuthUseCase>(() => AuthUseCase());
  getIt.registerFactory<AuthRepository>(() => AuthRepositoryImpl());
  //! until the preperation of backend services, mocks are used
  getIt.registerFactory<AuthDataSource>(() => AuthDataSourceMockImpl());
  //TODO: replace the line below when backend services are ready
  // getIt.registerFactory<AuthDataSource>(() => AuthDataSourceImpl());

  getIt.registerFactory<StadiumUseCase>(() => StadiumUseCase());
  getIt.registerFactory<StadiumRepository>(() => StadiumRepositoryImpl());
  //! until the preperation of backend services, mocks are used
  getIt.registerFactory<StadiumDataSource>(() => StadiumDataSourceMockImpl());
  //TODO: uncomment the line below when backend services are ready
  // getIt.registerFactory<StadiumDataSource>(() => StadiumDataSourceImpl());
}

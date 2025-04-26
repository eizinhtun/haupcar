import 'package:get_it/get_it.dart';
import 'package:haupcar/data/data.dart';
import 'package:haupcar/domain/domain.dart';
import 'package:haupcar/presentation/presentation.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt getIt = GetIt.instance;

Future configureDependencies() async {
  getIt.registerSingleton<SharedPrefs>(
      SharedPrefs(await SharedPreferences.getInstance()));
  getIt.registerLazySingleton<NetworkService>(() => NetworkService.instance());

  // await Hive.openBox(RECIPE_CACHE_BOX_NAME);

  ///`Datasources`
  getIt.registerLazySingleton<CategoryRemoteDataSource>(
    () => CategoryRemoteDataSourceImpl(networkService: getIt()),
  );

  getIt.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(networkService: getIt()),
  );

  ///`Repository`

  getIt.registerLazySingleton<GoodsRepository>(
    () => GoodsRepositoryImpl(
        categoryRemoteDataSource: getIt(), productRemoteDataSource: getIt()),
  );

  ///`Usecases`
  getIt.registerLazySingleton<GetCategories>(
    () => GetCategories(getIt()),
  );
  getIt.registerLazySingleton<GetProductsByCategory>(
    () => GetProductsByCategory(getIt()),
  );

  ///`Bloc`
  getIt.registerFactory<CategoryBloc>(
      () => CategoryBloc(getCategories: getIt()));
  getIt.registerFactory<ProductsBloc>(
    () => ProductsBloc(getProductsByCategory: getIt()),
  );
  getIt.registerFactory<LanguageCubit>(() => LanguageCubit());
}

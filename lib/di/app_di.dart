import 'package:get_it/get_it.dart';
import 'package:haupcar/data/data.dart';
import 'package:haupcar/domain/domain.dart';
import 'package:haupcar/presentation/presentation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences/util/legacy_to_async_migration_util.dart';

GetIt getIt = GetIt.instance;

Future configureDependencies() async {
  const SharedPreferencesOptions sharedPreferencesOptions =
      SharedPreferencesOptions();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await migrateLegacySharedPreferencesToSharedPreferencesAsyncIfNecessary(
    legacySharedPreferencesInstance: prefs,
    sharedPreferencesAsyncOptions: sharedPreferencesOptions,
    migrationCompletedKey: 'migrationCompleted',
  );
  getIt.registerSingleton<SharedPrefs>(SharedPrefs(prefs));

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

import 'package:get_it/get_it.dart';
import 'package:haupcar/data/datasources/category_remote_data_source.dart';
import 'package:haupcar/data/datasources/product_remote_data_source.dart';
import 'package:haupcar/data/repositories/goods_repository_impl.dart';
import 'package:haupcar/data/services/network_service.dart';
import 'package:haupcar/domain/repositories/goods_repository.dart';
import 'package:haupcar/presentation/bloc/category/category_bloc.dart';
import 'package:haupcar/presentation/bloc/products/products_bloc.dart';

GetIt getIt = GetIt.instance;

Future configureDependencies() async {
  getIt.registerLazySingleton<NetworkService>(() => NetworkService.instance());

  // await Hive.openBox(RECIPE_CACHE_BOX_NAME);

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

  ///`Bloc`
  getIt.registerFactory<CategoryBloc>(
      () => CategoryBloc(getCategories: getIt()));
  getIt.registerFactory<ProductsBloc>(
    () => ProductsBloc(getProductsByCategory: getIt()),
  );
}

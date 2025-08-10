// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../features/news/data/datasources/local/country_data_source.dart'
    as _i903;
import '../../features/news/data/datasources/remote/news_data_source.dart'
    as _i698;
import '../../features/news/data/repositories/country_repositories_impl.dart'
    as _i1014;
import '../../features/news/data/repositories/news_repositories_impl.dart'
    as _i13;
import '../../features/news/domain/repositories/country_repositories.dart'
    as _i216;
import '../../features/news/domain/repositories/news_repositories.dart'
    as _i632;
import '../../features/news/domain/usecase/check_country_app_usecase.dart'
    as _i664;
import '../../features/news/domain/usecase/create_country_app_usecase.dart'
    as _i378;
import '../../features/news/domain/usecase/get_news_based_on_category_usecase.dart'
    as _i62;
import '../../features/news/domain/usecase/get_top_headlines_usecase.dart'
    as _i640;
import '../../features/news/presentations/bloc/country/country_bloc.dart'
    as _i574;
import '../../features/news/presentations/bloc/news/news_bloc.dart' as _i653;
import 'module/injectable_module.dart' as _i467;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final injectableModules = _$InjectableModules();
    gh.lazySingleton<_i361.Dio>(() => injectableModules.dio);
    await gh.lazySingletonAsync<_i460.SharedPreferences>(
      () => injectableModules.preferences,
      preResolve: true,
    );
    gh.lazySingleton<_i698.NewsRemoteDataSource>(
      () => _i698.NewsRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i903.CountryDataSource>(
      () => _i903.CountryDataSourceImpl(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i216.CountryRepositories>(
      () => _i1014.CountryRepositoriesImpl(gh<_i903.CountryDataSource>()),
    );
    gh.lazySingleton<_i664.CheckCountryAppUsecase>(
      () => _i664.CheckCountryAppUsecase(gh<_i216.CountryRepositories>()),
    );
    gh.lazySingleton<_i378.CreateCountryAppUsecase>(
      () => _i378.CreateCountryAppUsecase(gh<_i216.CountryRepositories>()),
    );
    gh.factory<_i574.CountryBloc>(
      () => _i574.CountryBloc(
        gh<_i664.CheckCountryAppUsecase>(),
        gh<_i378.CreateCountryAppUsecase>(),
      ),
    );
    gh.lazySingleton<_i632.NewsRepositories>(
      () => _i13.NewsRepositoriesImpl(gh<_i698.NewsRemoteDataSource>()),
    );
    gh.lazySingleton<_i62.GetNewsBasedOnCategoryUsecase>(
      () => _i62.GetNewsBasedOnCategoryUsecase(gh<_i632.NewsRepositories>()),
    );
    gh.lazySingleton<_i640.GetTopHeadlinesUseCase>(
      () => _i640.GetTopHeadlinesUseCase(gh<_i632.NewsRepositories>()),
    );
    gh.factory<_i653.NewsBloc>(
      () => _i653.NewsBloc(
        gh<_i640.GetTopHeadlinesUseCase>(),
        gh<_i664.CheckCountryAppUsecase>(),
        gh<_i62.GetNewsBasedOnCategoryUsecase>(),
      ),
    );
    return this;
  }
}

class _$InjectableModules extends _i467.InjectableModules {}

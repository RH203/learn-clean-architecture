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

import '../../features/news/data/datasources/remote/news_data_source.dart'
    as _i698;
import '../../features/news/data/repositories/news_repositories_impl.dart'
    as _i13;
import '../../features/news/domain/repositories/news_repository.dart' as _i258;
import '../../features/news/domain/usecase/get_top_headlines_usecase.dart'
    as _i640;
import '../../features/news/presentations/bloc/news_bloc.dart' as _i616;
import 'module/injectable_module.dart' as _i467;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final injectableModules = _$InjectableModules();
    gh.lazySingleton<_i361.Dio>(() => injectableModules.dio);
    gh.lazySingleton<_i698.NewsRemoteDataSource>(
      () => _i698.NewsRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i258.NewsRepositories>(
      () => _i13.NewsRepositoriesImpl(gh<_i698.NewsRemoteDataSource>()),
    );
    gh.lazySingleton<_i640.GetTopHeadlinesUseCase>(
      () => _i640.GetTopHeadlinesUseCase(gh<_i258.NewsRepositories>()),
    );
    gh.factory<_i616.NewsBloc>(
      () => _i616.NewsBloc(gh<_i640.GetTopHeadlinesUseCase>()),
    );
    return this;
  }
}

class _$InjectableModules extends _i467.InjectableModules {}

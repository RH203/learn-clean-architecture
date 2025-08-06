import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:learn_clean_archi/core/env/env.dart';

@module
abstract class InjectableModules {
  @lazySingleton
  Dio get dio => Dio(
    BaseOptions(baseUrl: Env.BASE_URL, headers: {'Authorization': Env.API_KEY}),
  );
}

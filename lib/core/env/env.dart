import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField()
  static const String BASE_URL = _Env.BASE_URL;

  @EnviedField()
  static const String API_KEY = _Env.API_KEY;
}

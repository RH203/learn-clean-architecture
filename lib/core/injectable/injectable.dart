import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:learn_clean_archi/core/injectable/injectable.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
  usesNullSafety: true
)
Future<void> configureDependencies() async => getIt.init();

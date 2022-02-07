import 'package:ollie_tracktime/core/inject.dart';
import 'package:ollie_tracktime/features/auth/infrastructure/factory/login_provider.dart';

class DependencyResolve {
  //Indique suas dependencias
  List<Inject> dependency = [LoginProvider()];

  DependencyResolve() {
    for (final dep in dependency) {
      dep.init();
    }
  }
}

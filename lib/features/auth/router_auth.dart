import 'package:ollie_tracktime/core/router_provider.dart';
import 'package:ollie_tracktime/core/util.dart';
import 'package:ollie_tracktime/features/auth/presentation/ui/pages/login_page.dart';

class RouterAuth implements RouterProvider {
  @override
  Map<String, WidgetBuilderArgs> get routes => {
        '/login': (context, args) => const LoginPage(),
      };
}

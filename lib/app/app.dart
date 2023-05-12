import 'package:flutter/material.dart';

import '../core/routers/routes_config.dart';
import '../core/theme/app_theme.dart';

class DisneyPlus extends StatelessWidget {
  const DisneyPlus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Disney Plus',
      theme: AppTheme.lightTheme,
      routerConfig: RoutesConfig.routeConfig,
    );
  }
}

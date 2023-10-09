import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:white_board/routes.dart';
import 'package:white_board/app_theme.dart';

void main() {
  runApp(const WhiteBorad());
}

class WhiteBorad extends StatelessWidget {
  const WhiteBorad({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.downToUp,
      initialRoute: Routes.signIn,
      getPages: Routes.routes,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.system,
    );
  }
}

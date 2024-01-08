import 'package:flutter/material.dart';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_strategy/url_strategy.dart';

import 'app/app.bottomsheets.dart';
import 'app/app.dialogs.dart';
import 'app/app.locator.dart';
import 'app/app.router.dart';
import 'ui/common/app_colors.dart';
import 'ui/common/app_constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  await setupLocator(stackedRouter: stackedRouter);
  setupDialogUi();
  setupBottomSheetUi();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    var delay = const Duration(milliseconds: 50);
    var duration = const Duration(milliseconds: 400);

    return ResponsiveApp(
      builder: (_) => MaterialApp.router(
        routerDelegate: stackedRouter.delegate(),
        routeInformationParser: stackedRouter.defaultRouteParser(),
        title: ksAppTitle,
        theme: ThemeData(
          primarySwatch: generateMaterialColor(Palette.primary),
          scaffoldBackgroundColor: Palette.background,
          useMaterial3: false,
          appBarTheme: const AppBarTheme(
            backgroundColor: Palette.background,
            iconTheme: IconThemeData(color: Colors.black),
            systemOverlayStyle: kcSystemUiOverlayLight,
          ),
        ),
      ),
    ).animate().fadeIn(delay: delay, duration: duration);
  }
}

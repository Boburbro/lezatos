import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:lezatos/data/local/local_storage.dart';
import 'package:lezatos/generated/l10n/app_localizations.dart';
import 'package:lezatos/presentation/app_router.dart';
import 'package:lezatos/utils/constants/route_names.dart';
import 'package:lezatos/utils/ui/app_theme.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
String currentPath = "";

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: add RepositoryProvider and MultiBlocProvider

    return const AppView();
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => AppViewState();

  static AppViewState? of(BuildContext context) =>
      context.findAncestorStateOfType<AppViewState>();
}

class AppViewState extends State<AppView> {
  Locale? _locale;
  void setLocale(Locale value) {
    LocalStorage.getInstance().saveLanguage(value.languageCode);
    setState(() {
      _locale = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,

        builder: (BuildContext context, Widget? child) {
          return AdaptiveTheme(
            dark: AppTheme.darkTheme,
            light: AppTheme.lightTheme,
            initial: AdaptiveThemeMode.light,
            builder: (light, dark) {
              return MaterialApp(
                locale: _locale,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: const [
                  Locale('en', "US"),
                  Locale('ru', "RU"),
                ],
                debugShowCheckedModeBanner: false,
                darkTheme: dark,
                theme: light,
                onGenerateRoute: AppRouter.generateRoute,
                initialRoute: RouteNames.splashRoute,
                navigatorKey: navigatorKey,
                builder: (context, child) {
                  return MediaQuery(
                    data: MediaQuery.of(
                      context,
                    ).copyWith(textScaler: const TextScaler.linear(1.0)),
                    child: child!,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

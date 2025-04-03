import 'package:flutter/material.dart';
import 'routes/routes.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // return MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider(create: (context) => const ConfigurePlan()),
    //   ],
    //   child:

    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      title: 'No More Smoke',
      routes: Routes.routes,
      initialRoute: Routes.SPLASH_SCREEN,
      navigatorKey: navigatorKey,
      // ),
    );
  }
}

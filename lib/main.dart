import 'package:bluestacks_flutter_assigment/services/local_data/config.dart';
import 'package:bluestacks_flutter_assigment/services/provider/locale_provider.dart';
import 'package:bluestacks_flutter_assigment/services/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

import 'l10n/l10n.dart';

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GameTv.sharedPreferences = await SharedPreferences.getInstance();

  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent)
  );

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) =>
      ChangeNotifierProvider(
          create: (context) => LocaleProvider(),
          builder: (context, child) {
            final provider = Provider.of<LocaleProvider>(context);
            return MaterialApp(
              title: 'game.tv',
              locale: provider.locale,
              supportedLocales: L10n.all,
              localizationsDelegates: [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              home: Wrapper(),
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  visualDensity: VisualDensity.adaptivePlatformDensity
              ),
              builder: (context, navigator) {
                var lang = Localizations.localeOf(context).languageCode;
                return Theme(
                  data: ThemeData(
                    textTheme: Theme.of(context).textTheme.apply(
                      fontSizeDelta: lang == 'ja' ? -3 : 0
                    ),
                  ),
                  child: navigator!,
                );
              },
            );
          }
      );
}

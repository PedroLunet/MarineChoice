import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'wrapper.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:marinechoice/l10n/l10n.dart';
import 'globals.dart' as globals;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        name: 'Marinechoice',
        options: const FirebaseOptions(
          apiKey: 'key',
          appId: 'id',
          messagingSenderId: 'sendid',
          projectId: 'myapp',
          // storageBucket: 'myapp-b9yt18.appspot.com',
        ));
  } else {
    await Firebase.initializeApp(
        name: 'Marinechoice',
        options: const FirebaseOptions(
          apiKey: 'key',
          appId: 'id',
          messagingSenderId: 'sendid',
          projectId: 'myapp',
          storageBucket: 'myapp-b9yt18.appspot.com',
        ));
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: globals.selectedLanguage,
      builder: (context, value, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: 'Poppins'),
          home: const Wrapper(),
          supportedLocales: L10n.all,
          locale: Locale(value),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
        );
      },
    );
  }
}

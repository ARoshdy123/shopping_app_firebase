import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app_firebase/screens/login_screen.dart';
import 'package:shopping_app_firebase/screens/main_screen.dart';
import 'package:shopping_app_firebase/screens/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en', 'US'), Locale('ar', 'EG')],
        path: 'languages', // <-- change the path of the translation files
        fallbackLocale: Locale('en', 'US'),
        child: ShoppingApp()),
  );
}

class ShoppingApp extends StatelessWidget {
  const ShoppingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      useMaterial3: true,),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      initialRoute: '/signup',
      routes: {
        '/signup': (context) => const SignUpScreen(),
        '/login': (context) => const LoginScreen(),
        '/main': (context) => const MainScreen(),
      },
    );
  }
}

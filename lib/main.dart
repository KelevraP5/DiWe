import 'package:diwe_flutter/pages/splash_page.dart';
import 'package:diwe_flutter/pages/welcome_page.dart';
import 'pages/home_page.dart';
import 'pages/auth/login_page.dart';
import 'package:diwe_flutter/pages/auth/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'services/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DiWe App',
      routes: {
        '/': (context) => SplashScreen(
              child: WelcomePage(),
            ),
        '/login': (context) => LoginPage(),
        '/signUp': (context) => SignUpPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}

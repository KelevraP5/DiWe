import 'package:diwe_flutter/features/app/splash_screen/splash_screen.dart';
import 'package:diwe_flutter/features/user_auth/presentation/pages/home_page.dart';
import 'package:diwe_flutter/features/user_auth/presentation/pages/login_page.dart';
import 'package:diwe_flutter/features/user_auth/presentation/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:diwe_flutter/features/user_auth/presentation/pages/welcome_page.dart';

const d_red = const Color(0xFF46497C);

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
      title: 'Flutter DiWe',
      routes: {
        '/': (context) => SplashScreen(
              // Here, you can decide whether to show the LoginPage or HomePage based on user authentication
              child: WelcomePage(),
            ),
        '/login': (context) => LoginPage(),
        '/signUp': (context) => SignUpPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}

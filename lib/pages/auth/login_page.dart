import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:diwe_flutter/services/firebase_auth_services.dart';
import '../delayed_animation.dart';
import '../colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  var _obscureText = true;

  String _emailErrorText = '';
  String _passwordErrorText = '';
  String _loginErrorText = ''; // Ajout d'une variable pour afficher les erreurs de connexion

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secondaryColor.withOpacity(0),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.quaternaryColor,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DelayedAnimation(
              delay: 1500,
              child: Container(
                margin: EdgeInsets.symmetric(
                  vertical: 40,
                  horizontal: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "SE CONNECTER",
                      style: GoogleFonts.poppins(
                        color: AppColors.primaryColor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 22),
                    Text(
                      "Connectez-vous avec votre adresse e-mail et votre mot de passe.",
                      style: GoogleFonts.poppins(
                        color: AppColors.septenaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 35),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Votre Adresse Email',
                  labelStyle: TextStyle(
                    color: AppColors.tertiaryColor,
                  ),
                  errorText: _emailErrorText.isNotEmpty ? _emailErrorText : null,
                ),
                onChanged: (_) {
                  setState(() {
                    _emailErrorText = '';
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                obscureText: _obscureText,
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Mot de passe',
                  labelStyle: TextStyle(
                    color: AppColors.tertiaryColor,
                  ),
                  errorText: _passwordErrorText.isNotEmpty ? _passwordErrorText : null,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                      color: AppColors.tertiaryColor,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                ),
                onChanged: (_) {
                  setState(() {
                    _passwordErrorText = '';
                  });
                },
              ),
            ),
            SizedBox(height: 10), // Espace supplémentaire entre le champ de mot de passe et le message d'erreur
            Visibility(
              visible: _loginErrorText.isNotEmpty, // Afficher le message d'erreur seulement s'il y a une erreur de connexion
              child: Text(
                _loginErrorText,
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
            SizedBox(height: 125),
            GestureDetector(
              onTap: _signIn,
              child: Container(
                width: 325,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Text(
                    "Se connecter",
                    style: TextStyle(
                      color: AppColors.secondaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void _signIn() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    if (email.isEmpty) {
      setState(() {
        _emailErrorText = 'Ce champ est requis';
      });
      return;
    }

    if (password.isEmpty) {
      setState(() {
        _passwordErrorText = 'Ce champ est requis';
      });
      return;
    }

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    if (user != null) {
      print("User logged in");
      Navigator.pushNamed(context, "/home");
    } else {
      setState(() {
        _loginErrorText = 'Adresse e-mail ou mot de passe incorrect';
      });
      print("Error");
    }
  }
}

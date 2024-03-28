import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:diwe_flutter/services/firebase_auth_services.dart';
import '../delayed_animation.dart';
import '../colors.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  var _obscureText = true;

  String _usernameErrorText = '';
  String _emailErrorText = '';
  String _passwordErrorText = '';

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
                      "S\'INSCRIRE",
                      style: GoogleFonts.poppins(
                        color: AppColors.primaryColor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 22),
                    Text(
                      "Veuillez remplir les champs ci-dessous pour créer un compte.",
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
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Votre Nom',
                  labelStyle: TextStyle(
                    color: AppColors.tertiaryColor,
                  ),
                  errorText: _usernameErrorText.isNotEmpty ? _usernameErrorText : null,
                ),
                onChanged: (_) {
                  setState(() {
                    _usernameErrorText = '';
                  });
                },
              ),
            ),
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
            SizedBox(height: 125),
            GestureDetector(
              onTap: _signUp,
              child: Container(
                width: 325,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Text(
                    "Créer un compte",
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

  void _signUp() async {
    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    if (username.isEmpty) {
      setState(() {
        _usernameErrorText = 'Ce champ est requis';
      });
      return;
    }

    if (email.isEmpty) {
      setState(() {
        _emailErrorText = 'Ce champ est requis';
      });
      return;
    }

    if (!isValidEmail(email)) {
      setState(() {
        _emailErrorText = 'Veuillez saisir une adresse e-mail valide';
      });
      return;
    }

    if (password.isEmpty) {
      setState(() {
        _passwordErrorText = 'Ce champ est requis';
      });
      return;
    }

    if (password.length < 5) {
      setState(() {
        _passwordErrorText = 'Le mot de passe doit contenir au moins 5 caractères';
      });
      return;
    }

    if (!containsUpperCase(password)) {
      setState(() {
        _passwordErrorText = 'Le mot de passe doit contenir au moins une lettre majuscule';
      });
      return;
    }

    if (!containsSpecialCharacter(password)) {
      setState(() {
        _passwordErrorText = 'Le mot de passe doit contenir au moins un caractère spécial';
      });
      return;
    }

    // Vérifier si l'e-mail est déjà utilisé
    bool isEmailInUse = await _auth.isEmailAlreadyInUse(email);
    if (isEmailInUse) {
      setState(() {
        _emailErrorText = 'Cet e-mail est déjà associé à un compte';
      });
      return;
    }

    // Ajoutez d'autres validations pour le mot de passe, si nécessaire

    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    if (user != null) {
      print("User created");
      Navigator.pushNamed(context, "/home");
    } else {
      print("Error");
      // Afficher un message d'erreur approprié en cas d'échec de l'inscription
    }
  }

  bool isValidEmail(String email) {
    // Expression régulière pour valider l'adresse e-mail
    String emailRegex =
        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    RegExp regex = RegExp(emailRegex);
    return regex.hasMatch(email);
  }

  bool containsUpperCase(String password) {
    return password.contains(RegExp(r'[A-Z]'));
  }

  bool containsSpecialCharacter(String password) {
    return password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>_]'));
  }
}

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<bool> isEmailAlreadyInUse(String email) async {
    try {
      UserCredential? userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: 'randomPassword', // Utilisez un mot de passe aléatoire pour éviter la création de compte
      );
      if (userCredential.user != null) {
        await userCredential.user?.delete(); // Supprimez l'utilisateur créé pour vérifier l'e-mail
        return false; // L'e-mail n'est pas déjà utilisé
      } else {
        return true; // L'e-mail est déjà utilisé
      }
    } catch (e) {
      return true; // Une exception est levée, donc l'e-mail est déjà utilisé
    }
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'delayed_animation.dart';
import 'social_page.dart';
import 'colors.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: screenSize.height * 0.1, // 10% de la hauteur de l'écran
            horizontal: screenSize.width * 0.1, // 10% de la largeur de l'écran
          ),
          child: Column(
            children: [
              DelayedAnimation(
                delay: 1500,
                child: Container(
                  child: Image.asset('assets/images/logo2.png'),
                  width: screenSize.width * 0.2,
                  // 20% de la largeur de l'écran
                  height: screenSize.width * 0.2,
                  // 20% de la largeur de l'écran
                  margin: EdgeInsets.only(
                      bottom: screenSize.height *
                          0.02), // 2% de la hauteur de l'écran
                ),
              ),
              DelayedAnimation(
                delay: 2500,
                child: Container(
                  child: Image.asset('assets/images/img1.png'),
                  height: screenSize.height * 0.4,
                  // 40% de la hauteur de l'écran
                  margin: EdgeInsets.only(
                    top: screenSize.height * 0.05,
                    // 5% de la hauteur de l'écran
                    bottom: screenSize.height *
                        0.05, // 5% de la hauteur de l'écran (ajout de l'espace en dessous)
                  ),
                ),
              ),
              DelayedAnimation(
                delay: 3500,
                child: Container(
                  margin: EdgeInsets.only(
                    top: screenSize.height * 0.03,
                    // 3% de la hauteur de l'écran
                    bottom:
                        screenSize.height * 0.02, // 2% de la hauteur de l'écran
                  ),
                  child: Text(
                    "Ensemble pour un diabète maîtrisé",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: AppColors.tertiaryColor,
                      fontSize: screenSize.width *
                          0.04, // 4% de la largeur de l'écran
                    ),
                  ),
                ),
              ),
              DelayedAnimation(
                delay: 4500,
                child: Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      shape: StadiumBorder(),
                      padding: EdgeInsets.all(screenSize.width *
                          0.032), // 3.2% de la largeur de l'écran
                    ),
                    child: Text(
                      'COMMENCER',
                      style: TextStyle(
                        color: AppColors.secondaryColor,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SocialPage(),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:diwe_flutter/pages/auth/type_login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'delayed_animation.dart';
import 'colors.dart';
import 'auth/sign_up_page.dart';
import 'auth/login_page.dart';

class SocialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double scaleFactor = screenSize.width > 600 ? 1.0 : 0.8;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            DelayedAnimation(
              delay: 1500,
              child: Padding(
                padding: EdgeInsets.only(top: 50 * scaleFactor),
                child: Container(
                  height: 280 * scaleFactor,
                  child: Image.asset('assets/images/img2.png'),
                ),
              ),
            ),
            DelayedAnimation(
              delay: 2500,
              child: Container(
                margin: EdgeInsets.symmetric(
                    vertical: 40 * scaleFactor, horizontal: 30 * scaleFactor),
                child: Column(
                  children: [
                    Text(
                      "Commencez dès Maintenant",
                      style: GoogleFonts.poppins(
                        color: AppColors.primaryColor,
                        fontSize: 16 * scaleFactor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 10 * scaleFactor),
                    Text(
                      "Connectez-vous ou inscrivez-vous pour débuter avec DiWe !",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: AppColors.tertiaryColor,
                        fontSize: 15 * scaleFactor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            DelayedAnimation(
              delay: 3500,
              child: Container(
                margin: EdgeInsets.symmetric(
                    vertical: 24 * scaleFactor, horizontal: 40 * scaleFactor),
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        backgroundColor: AppColors.primaryColor,
                        padding: EdgeInsets.all(13 * scaleFactor),
                        minimumSize: Size(double.infinity, 50 * scaleFactor),
                      ),
                      child: Text(
                        'S\'inscrire gratuitement',
                        style: GoogleFonts.poppins(
                          color: AppColors.secondaryColor,
                          fontSize: 16 * scaleFactor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 20 * scaleFactor),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        backgroundColor: AppColors.secondaryColor,
                        padding: EdgeInsets.all(13 * scaleFactor),
                        minimumSize: Size(double.infinity, 50 * scaleFactor),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/google.png',
                            height: 20 * scaleFactor,
                          ),
                          SizedBox(width: 10 * scaleFactor),
                          Text(
                            'Continuer avec Google',
                            style: GoogleFonts.poppins(
                              color: AppColors.quaternaryColor,
                              fontSize: 16 * scaleFactor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20 * scaleFactor),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        backgroundColor: AppColors.quinaryColor,
                        padding: EdgeInsets.all(13 * scaleFactor),
                        minimumSize: Size(double.infinity, 50 * scaleFactor),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.facebook,
                            color: AppColors.secondaryColor,
                          ),
                          SizedBox(width: 10 * scaleFactor),
                          Text(
                            'Continuer avec Facebook',
                            style: GoogleFonts.poppins(
                              color: AppColors.secondaryColor,
                              fontSize: 16 * scaleFactor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20 * scaleFactor),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        backgroundColor: AppColors.senaryColor,
                        padding: EdgeInsets.all(13 * scaleFactor),
                        minimumSize: Size(double.infinity, 50 * scaleFactor),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.apple,
                            color: AppColors.secondaryColor,
                          ),
                          SizedBox(width: 10 * scaleFactor),
                          Text(
                            'Continuer avec Apple',
                            style: GoogleFonts.poppins(
                              color: AppColors.secondaryColor,
                              fontSize: 16 * scaleFactor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20 * scaleFactor),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TypeLoginPage(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.only(top: 12 * scaleFactor),
                        child: Text(
                          'Se connecter',
                          style: GoogleFonts.poppins(
                            color: AppColors.primaryColor,
                            fontSize: 16 * scaleFactor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

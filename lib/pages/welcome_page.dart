import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'delayed_animation.dart';
import 'social_page.dart';
import 'colors.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: 100,
            horizontal: 30,
          ),
          child: Column(
            children: [
              DelayedAnimation(
                delay: 1500,
                child: Container(
                  child: Image.asset('assets/images/logo2.png'),
                  width: 100,
                  height: 100,
                  margin: EdgeInsets.only(bottom: 20),
                ),
              ),
              DelayedAnimation(
                delay: 2500,
                child: Container(
                  child: Image.asset('assets/images/img1.png'),
                  height: 400,
                  margin: EdgeInsets.only(top: 40),
                ),
              ),
              DelayedAnimation(
                delay: 3500,
                child: Container(
                  margin: EdgeInsets.only(
                    top: 30,
                    bottom: 20,
                  ),
                  child: Text(
                    "Ensemble pour un diabète maîtrisé",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: AppColors.tertiaryColor,
                      fontSize: 16,
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
                        padding: EdgeInsets.all(13)),
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

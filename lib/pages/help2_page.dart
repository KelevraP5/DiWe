import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class Help2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Aide',
          style: GoogleFonts.poppins(
            color: Colors.white, // Texte en blanc
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.primaryColor, // Fond de la barre d'app en primaryColor
      ),
      backgroundColor: AppColors.primaryColor, // Fond de la page en primaryColor
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Besoin d\'aide ?',
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Texte en blanc
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Contactez-nous pour toute question ou assistance.',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Colors.white, // Texte en blanc
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Action à effectuer lorsque le bouton est pressé
                },
                child: Text(
                  'Contacter le support',
                  style: TextStyle(
                    color: AppColors.primaryColor,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Bouton de couleur blanche
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 14, horizontal: 30),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

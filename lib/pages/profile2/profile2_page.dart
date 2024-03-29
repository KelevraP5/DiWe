import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../colors.dart';
import 'edit_profile2_page.dart';
import '../settings2_page.dart'; // Importez votre page Settings2Page
import '../social_page.dart';
import '../help2_page.dart';

class Profile2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profil',
          style: GoogleFonts.poppins(
            color: Colors.white, // Texte en blanc
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.primaryColor, // Fond de la barre d'app en primaryColor
        elevation: 0,
      ),
      backgroundColor: AppColors.primaryColor, // Fond de la page en primaryColor
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/images/profile_image.jpg'),
            ),
            SizedBox(height: 20),
            Text(
              'Tom Legrand',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Texte en blanc
              ),
            ),
            SizedBox(height: 10),
            Text(
              'tomlegrand@gmail.com',
              style: GoogleFonts.poppins(
                fontSize: 18,
                color: Colors.grey, // Texte en gris
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfile2Page()),
                );
              },
              child: Text(
                'Modifier le profil',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
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
            SizedBox(height: 40),
            ListTile(
              leading: Icon(Icons.help_outline, color: Colors.white, size: 30),
              title: Text(
                'Aide',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Colors.white, // Texte en blanc
                  fontWeight: FontWeight.normal,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Help2Page()),
                );
              },
            ),
            Divider(height: 20, thickness: 1, color: Colors.white), // Divider en blanc
            ListTile(
              leading: Icon(Icons.settings, color: Colors.white, size: 30),
              title: Text(
                'Paramètres',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Colors.white, // Texte en blanc
                  fontWeight: FontWeight.normal,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Settings2Page()), // Utilisez Settings2Page à la place de SettingsPage
                );
              },
            ),
            Divider(height: 20, thickness: 1, color: Colors.white), // Divider en blanc
            ListTile(
              leading: Icon(Icons.logout, color: Colors.white, size: 30),
              title: Text(
                'Déconnexion',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Colors.white, // Texte en blanc
                  fontWeight: FontWeight.normal,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SocialPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

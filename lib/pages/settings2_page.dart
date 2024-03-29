import 'package:flutter/material.dart';
import 'colors.dart';
import 'meal_page.dart'; // Importez les pages nécessaires
import 'home_page.dart';
import 'profile2/profile2_page.dart';

class Settings2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true, // Afficher la flèche de retour
        title: Text(
          'Paramètres',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white, // Texte en blanc
          ),
        ),
        backgroundColor: AppColors.primaryColor, // Fond de la barre d'app en primaryColor
      ),
      backgroundColor: AppColors.primaryColor, // Fond de la page en primaryColor
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.notifications, color: Colors.white, size: 30),
              title: Text(
                'Notifications',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white, // Texte en blanc
                  fontWeight: FontWeight.normal,
                ),
              ),
              onTap: () {
                // Action à effectuer lorsque l'élément est cliqué
              },
            ),
            Divider(height: 20, thickness: 1, color: Colors.white), // Divider en blanc
            ListTile(
              leading: Icon(Icons.language, color: Colors.white, size: 30),
              title: Text(
                'Langue',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white, // Texte en blanc
                  fontWeight: FontWeight.normal,
                ),
              ),
              onTap: () {
                // Action à effectuer lorsque l'élément est cliqué
              },
            ),
            Divider(height: 20, thickness: 1, color: Colors.white), // Divider en blanc
            ListTile(
              leading: Icon(Icons.security, color: Colors.white, size: 30),
              title: Text(
                'Confidentialité et sécurité',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white, // Texte en blanc
                  fontWeight: FontWeight.normal,
                ),
              ),
              onTap: () {
                // Action à effectuer lorsque l'élément est cliqué
              },
            ),
            Divider(height: 20, thickness: 1, color: Colors.white), // Divider en blanc
            ListTile(
              leading: Icon(Icons.person, color: Colors.white, size: 30),
              title: Text(
                'Compte',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white, // Texte en blanc
                  fontWeight: FontWeight.normal,
                ),
              ),
              onTap: () {
                // Navigation vers la page de profil (ProfilePage)
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Profile2Page()),
                );
              },
            ),
            Divider(height: 20, thickness: 1, color: Colors.white), // Divider en blanc
            ListTile(
              leading: Icon(Icons.feedback, color: Colors.white, size: 30),
              title: Text(
                'Commentaires',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white, // Texte en blanc
                  fontWeight: FontWeight.normal,
                ),
              ),
              onTap: () {
                // Action à effectuer lorsque l'élément est cliqué
              },
            ),
          ],
        ),
      ),
    );
  }
}

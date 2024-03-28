import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'colors.dart';
import 'meal_page.dart'; // Importez les pages nécessaires
import 'home_page.dart';
import 'profile/profile_page.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Paramètres',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.notifications, color: AppColors.primaryColor, size: 30),
              title: Text(
                'Notifications',
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.normal,
                ),
              ),
              onTap: () {
                // Action à effectuer lorsque l'élément est cliqué
              },
            ),
            Divider(height: 20, thickness: 1),
            ListTile(
              leading: Icon(Icons.language, color: AppColors.primaryColor, size: 30),
              title: Text(
                'Langue',
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.normal,
                ),
              ),
              onTap: () {
                // Action à effectuer lorsque l'élément est cliqué
              },
            ),
            Divider(height: 20, thickness: 1),
            ListTile(
              leading: Icon(Icons.security, color: AppColors.primaryColor, size: 30),
              title: Text(
                'Confidentialité et sécurité',
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.normal,
                ),
              ),
              onTap: () {
                // Action à effectuer lorsque l'élément est cliqué
              },
            ),
            Divider(height: 20, thickness: 1),
            ListTile(
              leading: Icon(Icons.person, color: AppColors.primaryColor, size: 30),
              title: Text(
                'Compte',
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.normal,
                ),
              ),
              onTap: () {
                // Navigation vers la page de profil (ProfilePage)
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            ),
            Divider(height: 20, thickness: 1),
            ListTile(
              leading: Icon(Icons.feedback, color: AppColors.primaryColor, size: 30),
              title: Text(
                'Commentaires',
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.primaryColor,
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
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color(0xFFFFFFFF),
        items: <Widget>[
          _buildIcon(Icons.home, Color(0xFFD7D4D4), 30),
          _buildIcon(Icons.local_dining, Color(0xFFD7D4D4), 30),
          _buildIcon(Icons.settings, AppColors.primaryColor, 30),
        ],
        onTap: (index) {
          // Ajoutez une logique de navigation ici
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
              break;
            case 1:
            // Navigation vers la page des repas
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MealPage()),
              );
              break;
            case 2:
            // Vous êtes déjà sur la page des paramètres, aucune action nécessaire
              break;
          }
        },
        index: 2, // Index de l'icône des paramètres pour qu'il soit activé par défaut
      ),
    );
  }

  Widget _buildIcon(IconData icon, Color color, double size) {
    return Icon(
      icon,
      size: size,
      color: color,
    );
  }
}

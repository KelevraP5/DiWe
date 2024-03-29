import 'package:diwe_flutter/pages/auth/widget/classes/user_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../colors.dart';
import 'edit_profile_page.dart';
import '../help_page.dart';
import '../settings_page.dart';
import '../invite_friend_page.dart';
import '../social_page.dart';

class ProfilePage extends StatelessWidget {
  final UserModel user = UserModel();

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double scaleFactor = screenSize.width > 600 ? 1.0 : 0.8;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profil',
          style: GoogleFonts.poppins(
            color: AppColors.primaryColor,
            fontSize: 20 * scaleFactor,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20 * scaleFactor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20 * scaleFactor),
            CircleAvatar(
              radius: 80 * scaleFactor,
              backgroundImage: AssetImage('assets/images/profile_image.jpg'),
            ),
            SizedBox(height: 20 * scaleFactor),
            Text(
              user.nom,
              style: GoogleFonts.poppins(
                fontSize: 24 * scaleFactor,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(height: 10 * scaleFactor),
            Text(
              user.email,
              style: GoogleFonts.poppins(
                fontSize: 18 * scaleFactor,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 30 * scaleFactor),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfilePage()),
                );
              },
              child: Text(
                'Modifier le profil',
                style: TextStyle(
                  fontSize: 16 * scaleFactor,
                  color: AppColors.secondaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25 * scaleFactor),
                ),
                padding: EdgeInsets.symmetric(
                    vertical: 14 * scaleFactor, horizontal: 30 * scaleFactor),
              ),
            ),
            SizedBox(height: 40 * scaleFactor),
            ListTile(
              leading: Icon(Icons.help_outline,
                  color: AppColors.primaryColor, size: 30 * scaleFactor),
              title: Text(
                'Aide',
                style: GoogleFonts.poppins(
                  fontSize: 18 * scaleFactor,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.normal,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HelpPage()),
                );
              },
            ),
            Divider(height: 20 * scaleFactor, thickness: 1),
            ListTile(
              leading: Icon(Icons.settings,
                  color: AppColors.primaryColor, size: 30 * scaleFactor),
              title: Text(
                'Paramètres',
                style: GoogleFonts.poppins(
                  fontSize: 18 * scaleFactor,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.normal,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },
            ),
            Divider(height: 20 * scaleFactor, thickness: 1),
            ListTile(
              leading: Icon(Icons.person_add,
                  color: AppColors.primaryColor, size: 30 * scaleFactor),
              title: Text(
                'Inviter un ami',
                style: GoogleFonts.poppins(
                  fontSize: 18 * scaleFactor,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.normal,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InviteFriendPage()),
                );
              },
            ),
            Divider(height: 20 * scaleFactor, thickness: 1),
            ListTile(
              leading: Icon(Icons.logout,
                  color: AppColors.primaryColor, size: 30 * scaleFactor),
              title: Text(
                'Déconnexion',
                style: GoogleFonts.poppins(
                  fontSize: 18 * scaleFactor,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.normal,
                ),
              ),
              onTap: () {
                FirebaseAuth.instance.signOut();
                UserModel().clear();
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

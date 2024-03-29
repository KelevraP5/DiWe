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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profil',
          style: GoogleFonts.poppins(
            color: AppColors.primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
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
              user.nom,
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(height: 10),
            Text(
              user.email,
              style: GoogleFonts.poppins(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 30),
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
                  fontSize: 16,
                  color: AppColors.secondaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 30),
              ),
            ),
            SizedBox(height: 40),
            ListTile(
              leading: Icon(Icons.help_outline,
                  color: AppColors.primaryColor, size: 30),
              title: Text(
                'Aide',
                style: GoogleFonts.poppins(
                  fontSize: 18,
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
            Divider(height: 20, thickness: 1),
            ListTile(
              leading:
                  Icon(Icons.settings, color: AppColors.primaryColor, size: 30),
              title: Text(
                'Paramètres',
                style: GoogleFonts.poppins(
                  fontSize: 18,
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
            Divider(height: 20, thickness: 1),
            ListTile(
              leading: Icon(Icons.person_add,
                  color: AppColors.primaryColor, size: 30),
              title: Text(
                'Inviter un ami',
                style: GoogleFonts.poppins(
                  fontSize: 18,
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
            Divider(height: 20, thickness: 1),
            ListTile(
              leading:
                  Icon(Icons.logout, color: AppColors.primaryColor, size: 30),
              title: Text(
                'Déconnexion',
                style: GoogleFonts.poppins(
                  fontSize: 18,
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

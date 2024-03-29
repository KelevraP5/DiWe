import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../colors.dart';
import 'profile2_page.dart';
import '../social_page.dart'; // Importer la page de réseau social

class EditProfile2Page extends StatefulWidget {
  @override
  _EditProfile2PageState createState() => _EditProfile2PageState();
}

class _EditProfile2PageState extends State<EditProfile2Page> {
  bool _isObscure = true;

  // Déclaration de fausses données
  String _fakeName = "Tom Legrand";
  String _fakeEmail = "tomlegrand@gmail.com";
  String _fakePassword = "Tomtomlgrd";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Modifier mon profil',
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
      body: SingleChildScrollView(
        child: Padding(
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
                'Modifier vos informations',
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Texte en blanc
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                style: TextStyle(color: Colors.white), // Texte en blanc
                initialValue: _fakeName,
                decoration: InputDecoration(
                  labelText: 'Nom',
                  labelStyle: TextStyle(color: Colors.white), // Texte en blanc
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white), // Contour en blanc
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                style: TextStyle(color: Colors.white), // Texte en blanc
                initialValue: _fakeEmail,
                decoration: InputDecoration(
                  labelText: 'Adresse Email',
                  labelStyle: TextStyle(color: Colors.white), // Texte en blanc
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white), // Contour en blanc
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                obscureText: _isObscure,
                style: TextStyle(color: Colors.white), // Texte en blanc
                initialValue: _fakePassword,
                decoration: InputDecoration(
                  labelText: 'Mot de passe',
                  labelStyle: TextStyle(color: Colors.white), // Texte en blanc
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white), // Contour en blanc
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off,
                      color: Colors.white, // Texte en blanc
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Actions à effectuer lors de l'appui sur le bouton Enregistrer
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Profile2Page()),
                  );
                },
                child: Text(
                  'Enregistrer',
                  style: TextStyle(
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
              SizedBox(height: 10), // Ajout d'un espace supplémentaire
              TextButton(
                onPressed: () {
                  // Actions à effectuer lors de l'appui sur le bouton Supprimer le compte
                  // Redirection vers la page de réseau social (SocialPage)
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SocialPage()),
                  );
                },
                child: Text(
                  'Supprimer mon compte',
                  style: TextStyle(
                    color: Colors.white, // Texte en blanc
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
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

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../colors.dart';
import 'edit_emergency_page.dart';
import 'add_emergency_page.dart';

class EmergencyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Urgence',
          style: GoogleFonts.poppins(
            color: AppColors.primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Liste des contacts',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Ces personnes seront automatiquement alertées par SMS en cas d\'urgence.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: 5, // Remplacer par la longueur de votre liste de personnes à alerter
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text((index + 1).toString()),
                  ),
                  title: Text(
                    'Nom Prénom ${index + 1}',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'Adresse SMS : +123456789${index + 1}', // Exemple d'adresse SMS
                    style: TextStyle(color: Colors.grey),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          // Navigation vers la page de modification du contact
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => EditEmergencyPage()),
                          );
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          // Action à effectuer lors de la suppression de la personne à alerter
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigation vers la page d'ajout d'un nouveau contact
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddEmergencyPage()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: AppColors.primaryColor, // Couleur de fond du bouton flottant
        foregroundColor: AppColors.secondaryColor, // Couleur de l'icône du bouton flottant
      ),
    );
  }
}

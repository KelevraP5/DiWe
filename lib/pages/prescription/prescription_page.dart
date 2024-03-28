import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../colors.dart';
import 'edit_prescription_page.dart';
import 'add_prescription_page.dart';

class PrescriptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ordonnances',
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
              'Liste des ordonnances',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: 5, // Remplacer par la longueur de votre liste d'ordonnances
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    'Ordonnance ${index + 1}',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          // Navigation vers la page de modification de l'ordonnance
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => EditPrescriptionPage()),
                          );
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          // Action à effectuer lors de la suppression de l'ordonnance
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
          // Navigation vers la page d'ajout d'une nouvelle ordonnance
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddPrescriptionPage()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: AppColors.primaryColor, // Couleur de fond du bouton flottant
        foregroundColor: AppColors.secondaryColor, // Couleur de l'icône du bouton flottant
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';
import 'profile2/profile2_page.dart';

class Patient {
  final String code;
  final String name;
  final String details;

  Patient({
    required this.code,
    required this.name,
    required this.details,
  });
}

class PatientListPage extends StatelessWidget {
  const PatientListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Patient> patients = [
      Patient(code: '20244', name: 'Jean Dupont', details: 'Sexe: Masculin\nAge: 45 ans\nAdresse: 123 rue de la Liberté, 75001 Paris'),
      Patient(code: '20245', name: 'Marie Martin', details: 'Sexe: Féminin\nAge: 32 ans\nAdresse: 456 avenue de la Paix, 69002 Lyon'),
      Patient(code: '20246', name: 'Pierre Durand', details: 'Sexe: Masculin\nAge: 60 ans\nAdresse: 789 boulevard de la République, 33000 Bordeaux'),
      Patient(code: '20247', name: 'Sophie Dubois', details: 'Sexe: Féminin\nAge: 28 ans\nAdresse: 1010 rue des Fleurs, 59000 Lille'),
      Patient(code: '20248', name: 'Nicolas Moreau', details: 'Sexe: Masculin\nAge: 50 ans\nAdresse: 202 chemin des Champs, 13001 Marseille'),
      Patient(code: '20249', name: 'Catherine Lefevre', details: 'Sexe: Féminin\nAge: 42 ans\nAdresse: 3030 avenue des Roses, 31000 Toulouse'),
      Patient(code: '20250', name: 'Thomas Laurent', details: 'Sexe: Masculin\nAge: 35 ans\nAdresse: 4040 allée des Pins, 67000 Strasbourg'),
      Patient(code: '20251', name: 'Isabelle Roux', details: 'Sexe: Féminin\nAge: 48 ans\nAdresse: 5050 rue des Lilas, 35000 Rennes'),
      Patient(code: '20252', name: 'David Garcia', details: 'Sexe: Masculin\nAge: 55 ans\nAdresse: 6060 boulevard des Chênes, 54000 Nancy'),
      Patient(code: '20253', name: 'Julie Petit', details: 'Sexe: Féminin\nAge: 29 ans\nAdresse: 7070 avenue des Violettes, 38000 Grenoble'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Liste des patients',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: AppColors.primaryColor,
      ),
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20), // Ajout d'espace horizontal
        child: ListView.builder(
          itemCount: patients.length, // Nombre de patients à afficher
          itemBuilder: (context, index) {
            return Card(
              elevation: 3,
              child: ListTile(
                title: Text(patients[index].name),
                subtitle: Text(patients[index].details),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.phone),
                      onPressed: () {
                        // Action pour appeler le patient
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        // Action pour modifier le patient
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        // Action pour supprimer le patient
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        backgroundColor: AppColors.primaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        onTap: (int index) {
          if (index == 1) {
            // L'utilisateur a cliqué sur l'icône de profil
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Profile2Page()),
            );
          }
        },
      ),
    );
  }
}

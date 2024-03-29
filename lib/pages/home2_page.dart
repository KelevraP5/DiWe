import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';
import 'profile2/profile2_page.dart';
import 'patient_page.dart';
import 'order_page.dart';

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

class Home2Page extends StatefulWidget {
  const Home2Page({Key? key}) : super(key: key);

  @override
  _Home2PageState createState() => _Home2PageState();
}

class _Home2PageState extends State<Home2Page> {
  TextEditingController _searchController = TextEditingController();
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
  Patient? _selectedPatient;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _searchPatient() {
    String code = _searchController.text;
    setState(() {
      _selectedPatient = patients.firstWhere((patient) => patient.code == code, orElse: () => Patient(code: '', name: '', details: ''));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Mon compte médecin',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: AppColors.primaryColor,
        actions: [
          IconButton(
            onPressed: () {
              // Action lorsque l'utilisateur appuie sur l'icône de profil
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile2Page()),
              );
            },
            icon: Icon(
              Icons.account_circle,
              color: Colors.white,
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      style: TextStyle(color: AppColors.primaryColor), // Couleur du texte
                      decoration: InputDecoration(
                        hintText: 'Rechercher par code patient',
                        hintStyle: TextStyle(color: AppColors.primaryColor), // Couleur du texte de l'indice
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: Colors.white, // Couleur de fond
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    onPressed: _searchPatient,
                    icon: Icon(Icons.search, color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            if (_selectedPatient != null) ...[
              Card(
                elevation: 3,
                child: ListTile(
                  title: Text(_selectedPatient!.name),
                  subtitle: Text(_selectedPatient!.details),
                  onTap: () {},
                ),
              ),
            ],
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Liste des patients',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PatientListPage()),
                    );
                  },
                  child: Text(
                    'Tout voir',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: patients.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 3,
                    child: ListTile(
                      title: Text(patients[index].name),
                      subtitle: Text(patients[index].details),
                      onTap: () {},
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Liste des ordonnances',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OrderListPage()),
                    );
                  },
                  child: Text(
                    'Tout voir',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 3,
                    child: ListTile(
                      title: Text('Ordonnance ${index + 1}'),
                      subtitle: Text('Détails de l\'ordonnance'),
                      onTap: () {},
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

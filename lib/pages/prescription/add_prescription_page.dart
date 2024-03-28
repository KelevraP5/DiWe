import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../colors.dart';

class AddPrescriptionPage extends StatefulWidget {
  @override
  _AddPrescriptionPageState createState() => _AddPrescriptionPageState();
}

class _AddPrescriptionPageState extends State<AddPrescriptionPage> {
  String _prescriptionName = '';
  String _filePath = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ajouter une ordonnance',
          style: GoogleFonts.poppins(
            color: AppColors.primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              'Nom de l\'ordonnance',
              style: TextStyle(
                fontSize: 18,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              initialValue: _prescriptionName,
              onChanged: (value) {
                setState(() {
                  _prescriptionName = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Nom de l\'ordonnance',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Document',
              style: TextStyle(
                fontSize: 18,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                // Action à effectuer lors du téléversement d'un document
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primaryColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _filePath.isNotEmpty ? '$_filePath' : 'Choisir un document',
                      style: TextStyle(
                        fontSize: 16,
                        color: _filePath.isNotEmpty ? AppColors.primaryColor : Colors.grey,
                      ),
                    ),
                    Icon(Icons.attach_file, color: AppColors.primaryColor),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action à effectuer lors de l'enregistrement de l'ordonnance
        },
        child: Icon(Icons.save),
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.secondaryColor, // Couleur de l'icône du bouton flottant
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

import 'package:flutter/material.dart';
import 'colors.dart';
import 'package:google_fonts/google_fonts.dart';

class BolusPage extends StatefulWidget {
  @override
  _BolusPageState createState() => _BolusPageState();
}

class _BolusPageState extends State<BolusPage> {
  double _bolusValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bolus',
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
              'Sélectionner la dose de bolus',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(height: 10),
            Slider(
              value: _bolusValue,
              min: 0,
              max: 10,
              divisions: 10,
              onChanged: (value) {
                setState(() {
                  _bolusValue = value;
                });
              },
              label: _bolusValue.toString(),
            ),
            SizedBox(height: 20),
            Text(
              'Dose sélectionnée: $_bolusValue',
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action à effectuer lors de l'enregistrement de la dose de bolus
          // par exemple : Navigator.pop(context);
        },
        child: Icon(Icons.save),
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.secondaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

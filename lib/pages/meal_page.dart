import 'package:diwe_flutter/services/meal_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'dart:io';
import 'colors.dart';

class MealPage extends StatefulWidget {
  @override
  _MealPageState createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
  File? _image;
  Map<String, dynamic>? _nutritionData;

  final picker = ImagePicker();
  final storage = FlutterSecureStorage();

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    dotenv.load();
    _loadNutritionData();
  }

  Future<void> _getImageAndAnalyze(ImageSource source) async {
    setState(() {
      _isLoading = true;
    });

    final foodvisorPost = FoodVisorPost();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });

      if (_image != null) {
        final apiKey = 'r6cK0ilT.U3yMnnxhwqvBkH6PVaW8LPdTNgodWvAo';
        if (apiKey != null) {
          try {
            final nutritionData =
                await foodvisorPost.analyzeImage(apiKey, _image!);

            await storage.write(
                key: '_nutritionData', value: jsonEncode(nutritionData));

            setState(() {
              _nutritionData = nutritionData;
              _isLoading = false;
            });
          } catch (e) {
            setState(() {
              _isLoading = false;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    'Erreur lors de l\'envoi de l\'image à l\'API FoodVisor'),
              ),
            );
          }
        } else {
          print('Clé API non trouvée.');
        }
      }
    } else {
      print('Aucune image sélectionnée.');
    }
  }

  Future<void> _loadNutritionData() async {
    setState(() {
      _isLoading = true;
    });

    String? jsonData = await storage.read(key: '_nutritionData');
    if (jsonData != null) {
      setState(() {
        _nutritionData = jsonDecode(jsonData);
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Page des repas',
          style: GoogleFonts.poppins(
            color: AppColors.primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _image == null
                      ? Text(
                          'Aucune image sélectionnée.',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : CircleAvatar(
                          radius: 80,
                          backgroundImage: FileImage(_image!),
                        ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => _getImageAndAnalyze(ImageSource.gallery),
                      child: Text(
                        'Sélectionner une image',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        padding:
                            EdgeInsets.symmetric(vertical: 14, horizontal: 30),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => _getImageAndAnalyze(ImageSource.camera),
                      child: Text(
                        'Prendre une photo',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        padding:
                            EdgeInsets.symmetric(vertical: 14, horizontal: 30),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  if (_nutritionData != null)
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(60, 64, 67, 0.3),
                            blurRadius: 2,
                            offset: Offset(0, 1),
                          ),
                          BoxShadow(
                            color: Color.fromRGBO(60, 64, 67, 0.15),
                            blurRadius: 3,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: DataTable(
                        columns: [
                          DataColumn(label: Text('Nutriment')),
                          DataColumn(label: Text('Valeur')),
                        ],
                        rows: [
                          DataRow(cells: [
                            DataCell(Text('Nom')),
                            DataCell(Text('${_nutritionData!['name']}')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Calories')),
                            DataCell(Text('${_nutritionData!['calories']}')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Protéines')),
                            DataCell(Text('${_nutritionData!['proteins']}')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Lipides')),
                            DataCell(Text('${_nutritionData!['lipids']}')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Glucides')),
                            DataCell(Text('${_nutritionData!['glucids']}')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Fibres')),
                            DataCell(Text('${_nutritionData!['fibers']}')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Calcium')),
                            DataCell(Text('${_nutritionData!['calcium']}')),
                          ]),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
          if (_isLoading)
            Container(
              color: AppColors.primaryColor.withOpacity(0.5),
              // Fond de couleur primaryColor
              child: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.white), // Couleur du cercle en blanc
                ),
              ),
            ),
        ],
      ),
    );
  }
}

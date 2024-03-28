import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class MealPage extends StatefulWidget {
  @override
  _MealPageState createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
  File? _image;
  Map<String, dynamic>? _nutritionData;

  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    dotenv.load(); // Charger les variables d'environnement depuis le fichier .env
  }

  Future<void> _getImageAndAnalyze(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });

      var apiKey = dotenv.env['API_KEY_FOOD_VISOR'];

      var request = http.MultipartRequest(
        'POST',
        Uri.parse(dotenv.env['API_FOOD_VISOR']! + '/analysis/'),
      )
        ..headers['Authorization'] = 'Api-Key $apiKey'
        ..files.add(await http.MultipartFile.fromPath('image', _image!.path));

      try {
        final response = await request.send();

        if (response.statusCode == 200) {
          final responseBody = await response.stream.bytesToString();
          final analysisResponse = jsonDecode(responseBody);
          final foodInfo = analysisResponse['items'][0]['food'][0]['food_info'];
          final nutrition = foodInfo['nutrition'];

          setState(() {
            _nutritionData = {
              'name': foodInfo['display_name'].toString(),
              'calories': nutrition['calories_100g'],
              'proteins': nutrition['proteins_100g'],
              'lipids': nutrition['fat_100g'],
              'glucids': nutrition['carbs_100g'],
              'fibers': nutrition['fibers_100g'],
              'calcium': nutrition['calcium_100g'],
            };
          });
        } else {
          Fluttertoast.showToast(
            msg: 'Failed to analyze image with FoodVisor. Status code: ${response.statusCode}',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
          );
        }
      } catch (e) {
        Fluttertoast.showToast(
          msg: 'Error: $e',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
        );
      }
    } else {
      Fluttertoast.showToast(
        msg: 'No image selected.',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image == null
                ? Text('No image selected.')
                : Image.file(
              _image!,
              height: 200,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _getImageAndAnalyze(ImageSource.gallery),
              child: Text('Select Image and Analyze'),
            ),
            ElevatedButton(
              onPressed: () => _getImageAndAnalyze(ImageSource.camera),
              child: Text('Take Photo and Analyze'),
            ),
            if (_nutritionData != null) ...[
              SizedBox(height: 20),
              Text(
                'Nutrition Data:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text('Name: ${_nutritionData!['name']}'),
              Text('Calories: ${_nutritionData!['calories']}'),
              Text('Proteins: ${_nutritionData!['proteins']}'),
              Text('Lipids: ${_nutritionData!['lipids']}'),
              Text('Glucids: ${_nutritionData!['glucids']}'),
              Text('Fibers: ${_nutritionData!['fibers']}'),
              Text('Calcium: ${_nutritionData!['calcium']}'),
            ],
          ],
        ),
      ),
    );
  }
}

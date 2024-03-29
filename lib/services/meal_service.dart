import 'dart:convert';
import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class FoodVisorPost {
  final FlutterSecureStorage _storage = FlutterSecureStorage();
  final String _foodVisorApiUrl = 'https://vision.foodvisor.io/api/1.0/fr/analysis/';

  // Modifiez le type de retour pour renvoyer les données d'analyse
  Future<Map<String, dynamic>> analyzeImage(String apiKey, File image) async {
    var request = http.MultipartRequest('POST', Uri.parse(_foodVisorApiUrl))
      ..headers['Authorization'] = 'Api-Key $apiKey'
      ..files.add(await http.MultipartFile.fromPath(
        'image',
        image.path,
        filename: basename(image.path),
      ));

    var response = await request.send();
    if (response.statusCode == 200) {
      var responseBody = await response.stream.bytesToString();
      var analysisResponse = jsonDecode(responseBody);
      print('Analysis from FoodVisor: $analysisResponse');
      var foodInfo = analysisResponse['items'][0]['food'][0]['food_info'];
      var nutrition = foodInfo['nutrition'];

      var mealInfo = {
        'name': foodInfo['display_name'].toString(),
        'calories': nutrition['calories_100g'],
        'proteins':nutrition['proteins_100g'].toString(),
        'lipids': nutrition['fat_100g'].toString(),
        'glucids': nutrition['carbs_100g'].toString(),
        'fibers': nutrition['fibers_100g'].toString(),
        'calcium':nutrition['calcium_100g'].toString(),
        'date': DateTime.now().toIso8601String(),
      };

      // Retournez les informations du repas
      return mealInfo;
    } else {
      print('Failed to analyze image with FoodVisor. Status code: ${response.statusCode}');
      var responseString = await response.stream.bytesToString();
      print('Response from FoodVisor: $responseString');
      // Si l'analyse échoue, vous pouvez choisir de renvoyer null ou de lancer une exception
      throw Exception('Failed to analyze image with FoodVisor.');
    }
  }

  Future<void> _storeMealInfo(Map<String, dynamic> mealInfo) async {
    await _storage.write(key: 'meal_info', value: jsonEncode(mealInfo));
    print('Meal information stored securely.');
  }
}

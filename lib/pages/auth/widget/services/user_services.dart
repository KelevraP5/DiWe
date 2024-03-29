import 'dart:convert';
import 'package:diwe_flutter/pages/auth/widget/classes/user_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

class UserServices {
  Future<UserModel?> getUser() async {
    var currentUserEmail = FirebaseAuth.instance.currentUser?.email;

    if (currentUserEmail == null) {
      throw Exception('No user currently authenticated.');
    }

    var url =
        Uri.parse("http://2bci.portfolio-etudiant-rouen.com:40000/api/users");
    final header = {'Authorization': 'Bearer ${UserModel().token}'};

    try {
      var response = await http.get(url, headers: header);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body)['result'] as List;
        for (var userData in data) {
          // print("userData, ${userData}");
          if (userData['email'] == currentUserEmail) {
            // print("userData, ${userData["_id"]}");
            // print("userDatan, $userData");
            // UserModel.updateFromJson(userData);
            await getOneUser(userData['_id']);
          }
        }

        // Si aucun utilisateur correspondant n'est trouvé
      } else {
        print('Erreur ${response.statusCode}: ${response.reasonPhrase}');
        throw Exception('Failed to load users');
      }
    } catch (e) {
      print('$e');
      throw Exception('Failed to load users');
    }
  }

  Future<UserModel?> getOneUser(String id) async {
    // print('ICI');

    // print(UserModel().token);
    // print('ICI');

    var url = Uri.parse(
        "http://2bci.portfolio-etudiant-rouen.com:40000/api/user/$id");
    final header = {'Authorization': 'Bearer ${UserModel().token}'};
    // print('ICI2');

    // print(header);
    try {
      var response = await http.get(url, headers: header);
      // print('ICI3');

      // print(response);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        // print("data, ${data}");
        UserModel.updateFromJson(data);
      } else {
        print('Erreur ${response.statusCode}: ${response.reasonPhrase}');
        throw Exception('Failed to load user');
      }
    } catch (e) {
      print('$e');
      throw Exception('Failed to load user');
    }
    return null;
  }
}

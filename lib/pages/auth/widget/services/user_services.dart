import 'dart:convert';
import 'package:diwe_flutter/pages/auth/widget/classes/user_data.dart';
import 'package:http/http.dart' as http;

class UserServices {
  Future<UserModel?> getUser() async {
    print('ICI');

    print(UserModel().token);
    print('ICI');

    var url = Uri.parse(
        "http://2bci.portfolio-etudiant-rouen.com:40000/api/user/66057365cf369f28fa7f6d84");
    final header = {'Authorization': 'Bearer ${UserModel().token}'};
    print('ICI2');

    print(header);
    try {
      var response = await http.get(url, headers: header);
      print('ICI3');

      print(response);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print("data, ${data}");
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

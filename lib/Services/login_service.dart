import 'dart:convert';
import 'dart:developer';
import 'package:note_sharing_app/models/login_response_model.dart';
import 'package:http/http.dart' as http;

class LoginService {
  Future<CreateUserResponse?> registerUser(
      {required String firstName,
      required String lastName,
      required String email,
      required String password,
      required String userName}) async {
    CreateUserResponse? userData;
    try {
      Map<String, dynamic> userDetail = {
        "first_name": firstName,
        "last_name": lastName,
        "name": "$firstName $lastName",
        "email": email,
        "password": password,
        "username": userName
      };
      http.Response response = await http.post(
          Uri.parse(
            "https://note-sharing-application.onrender.com/user/api/register/",
          ),
          headers: {'Content-Type': 'application/json', 'Charset': 'utf-8'},
          body: jsonEncode(userDetail));

      Map<String, dynamic> data =
          jsonDecode(response.body) as Map<String, dynamic>;
      log(response.body.toString());

      userData = CreateUserResponse.fromMap(data);
      log("${userData.access}------------inside function");
      log("${userData.refresh}------------inside function");
    } catch (e) {
      log('$e---error');
    }
    return userData;
  }
}


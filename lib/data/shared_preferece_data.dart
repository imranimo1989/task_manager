import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefData {
  static String? userToken,
      userEmail,
      userFirstName,
      userLastName,
      userMobile,
      userPhoto;

  static Future<void> saveDataToSharedPref(String token, String email,
      String firstname, String lastName, String mobile, String photo) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString("token", token);
    await sharedPreferences.setString("email", email);
    await sharedPreferences.setString("firstname", firstname);
    await sharedPreferences.setString("lastName", lastName);
    await sharedPreferences.setString("photo", photo);
    await sharedPreferences.setString("mobile", mobile);


    userToken = token;
    userEmail = email;
    userFirstName = firstname;
    userLastName = lastName;
    userMobile = mobile;
    userPhoto = photo;
  }

  static Future<bool> checkLoginState() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString('token');
    if (token == null) {
      return false;
    } else {
      return true;
    }
  }

  static Future<void> getDataFromSharedPref() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    userToken = sharedPreferences.getString('token');
    userEmail = sharedPreferences.getString('email');
    userFirstName = sharedPreferences.getString('firstname');
    userLastName = sharedPreferences.getString('lastName');
    userMobile = sharedPreferences.getString('mobile');
    userPhoto=sharedPreferences.getString("photo");

  }

  static Future<void>clearData()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();

  }

}


import 'package:jarvis/common/Storage/BaseSharedPreference.dart';
import 'package:jarvis/login/responses/LoginModel.dart';
import 'package:shared_preferences/shared_preferences.dart';


enum Keys{
  loginObj
}

class LoginHelper extends BaseSharedPreference{

  static var instance = LoginHelper();

  static Future<bool> logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("LoggedOut!");
    return prefs.remove("loginObj");
  }

  Future<void> saveLoginObject(String loginDetails) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("loginObj", loginDetails.toString());
  }

  Future<LoginModel> getUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var detail = prefs.getString("loginObj") as LoginModel;
    return detail;
  }

  Future<bool> isLoggedin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var detail = prefs.getString("loginObj");
    if (detail != null){
      return true;
    }else{
      return false;
    }
  }
}
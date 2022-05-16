import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  late SharedPreferences prefs;
  static bool? check;
//share or stop button
  void setShareData(bool check) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setBool('isShare', check);
  }

  void getShareData() async {
    prefs = await SharedPreferences.getInstance();
    check = prefs.getBool('isShare') ?? false;
  }
}

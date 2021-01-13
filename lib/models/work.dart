
import 'package:shared_preferences/shared_preferences.dart';

class SingletonWork {

  SingletonWork._privateConstructor() {
    initPreferences();
  }

  static final SingletonWork instance = SingletonWork._privateConstructor();

  int materialWork = 0;
  int workX = 0;
  int workZ = 0;



  void initPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getInt('materialWork') == null)
      prefs.setInt('materialWork', 1);

    if (prefs.getInt('workX') == null)
      prefs.setInt('workX', 10);

    if (prefs.getInt('workZ') == null)
      prefs.setInt('workZ', 10);

    materialWork = prefs.getInt('materialWork');
    workX = prefs.getInt('workX');
    workZ = prefs.getInt('workZ');

  }

}

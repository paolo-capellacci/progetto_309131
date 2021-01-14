
import 'package:shared_preferences/shared_preferences.dart';

class SingletonWork {

  SingletonWork._privateConstructor() {
    initPreferences();
  }

  static final SingletonWork instance = SingletonWork._privateConstructor();

  int materialWork = 40;
  double workX = 0.0;
  double workZ = 0.0;



  void initPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getInt('materialWork') == null)
      prefs.setInt('materialWork', 40);

    if (prefs.getDouble('workX') == null)
      prefs.setDouble('workX', 10.0);

    if (prefs.getDouble('workZ') == null)
      prefs.setDouble('workZ', 10.0);


    materialWork = prefs.getInt('materialWork');
    workX = prefs.getDouble('workX');
    workZ = prefs.getDouble('workZ');

  }

}


import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class GetEngineVersion extends ChangeNotifier {

  void initGetEngineVersion() {}

  String version = 'no conection';

  Future<String>getVersion() async {
    print('eeee');
    //notifyListeners();
    var url = 'http://paoloweb.altervista.org/00/version.php';
    final response = await http.post(
      url,
    );

    //print('Response status: ${response.statusCode}');
    //print('Response body: ${response.body}');

    version = response.body;

    notifyListeners();

    return version;
  }

}
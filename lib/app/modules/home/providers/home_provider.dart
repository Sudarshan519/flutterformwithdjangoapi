import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';

class HomeProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  String herourl = 'http://192.168.0.113:8000/heroes/';
  gethero() async {
    var response = await get(herourl);
    print(response.body());
  }

  posthero(String imagepath) async {
    var formdata = FormData({
      'name': 'wendux',
      'alias': 25,
      'image': MultipartFile(File(imagepath), filename: imagepath),
    });

    var response = await post(herourl, formdata);
    print(response.statusText);
  }

  getdata() async {
    var response =
        await get('https://eshop-42c42-default-rtdb.firebaseio.com/users.json');
    print(response.body);
  }

  postdata() async {
    Map data = {"name": "sudarshan", 'status': 'working'};
    var response = await post(
        'https://eshop-42c42-default-rtdb.firebaseio.com/users.json',
        jsonEncode(
            data)); //'https://mechanic-finder-f3fee.firebaseio.com/users.json
  }
}

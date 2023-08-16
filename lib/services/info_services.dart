import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:myapptest/const/errro_handling.dart';

import '../model/info_model.dart';

class InfoService {

  final String url =
      "http://139.59.119.57/api/get_advertisement?datetime=2020-03-1300";

  Future<List<Insert>> getData(BuildContext context) async {
    List<Insert> insertData = [];
    List<Insert> offerTypeAdvertisement = [];
    try {

      http.Response res = await http.post(Uri.parse(url));

      if(res.statusCode==200){
        var  jsonRes=jsonDecode(res.body);
        InfoData advertisement =
        InfoData.fromJson(jsonRes);



        for (Insert advertisement in advertisement.insert!) {
          if (advertisement.bannerType == "offer") {
            offerTypeAdvertisement.add(advertisement);
            print(offerTypeAdvertisement);
          }
        }
      }





    } catch (e) {
      print(e.toString());
    }
    return offerTypeAdvertisement;
  }
}

import 'dart:convert';

import 'package:covid_19/Model/WorldStatesModel.dart';
import 'package:covid_19/Services/Utilities/app_url.dart';
import 'package:http/http.dart'as http;
class StatesServices{
  ///! World Details
  Future<WorldStatesModel?> fetchWorldStatesModel()async{
    final response=await http.get(Uri.parse(AppUrl.worldStatesApi));
    if (response.statusCode==200) {
      var data=jsonDecode(response.body);
      return WorldStatesModel.fromJson(data);
    }  else{
      throw Exception("Error");
    }
  }

  ///! Countries Dteails
  Future<List<dynamic>> countriesListApi()async{
    var data;
    final response=await http.get(Uri.parse(AppUrl.countriesList));
    if (response.statusCode==200) {
       data=jsonDecode(response.body);
      return data;
    }  else{
      throw Exception("Error");
    }
  }
}

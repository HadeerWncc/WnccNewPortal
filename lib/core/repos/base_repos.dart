import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:wncc_portal/core/models/city_model.dart';
import 'package:wncc_portal/core/models/state_model.dart';

class BaseRepos {
  Future<List<String>> getStates() async {
    String jsonString =
        await rootBundle.loadString('assets/data/government.json');
    final jsonData = jsonDecode(jsonString) as List;
    List<StateModel> statesModel = [];
    for (var jsonState in jsonData) {
      statesModel.add(StateModel.fromJson(jsonState));
    }
    return jsonData
        .map<String>((item) => item['governorate_name_en'] as String)
        .toList();
  }

  Future<List<String>> getCities(String stateId) async {
    String jsonString =
        await rootBundle.loadString('assets/data/government_cities.json');
    final jsonData = jsonDecode(jsonString) as List;
    List<CityModel> cities = [];
    for (var jsonCity in jsonData) {
      cities.add(CityModel.fromJson(jsonCity));
    }
    cities = cities.where((c) => c.stateId == stateId).toList();
    return cities.map<String>((item) => item.city as String).toList();
  }

  Future<String> getStatesId(String state) async {
    String jsonString =
        await rootBundle.loadString('assets/data/government.json');
    final jsonData = jsonDecode(jsonString) as List;
    List<StateModel> states = [];
    for (var jsonState in jsonData) {
      states.add(StateModel.fromJson(jsonState));
    }
    states = states.where((s) => s.state == state).toList();
    return states.map<String>((item) => item.id as String).toList()[0];
  }
}

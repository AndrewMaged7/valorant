import 'dart:convert';

import 'package:valorant_app/models/agent_model.dart';
import 'package:http/http.dart' as http;
import 'package:valorant_app/models/map_model.dart';
import 'package:valorant_app/models/weapons_model.dart';

class ManagerApi {
  static Future<AgentModel?> getAgent() async {
    Uri url = Uri.parse("https://valorant-api.com/v1/agents");
    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    print(json);
    AgentModel agentModel = AgentModel.fromJson(json);
    return agentModel;
  }

  static Future<MapModel> getMap() async {
    Uri url = Uri.parse("https://valorant-api.com/v1/maps");
    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    MapModel mapModel = MapModel.fromJson(json);
    return mapModel;
  }

  static Future<WeaponsModel> getWeapon() async {
    Uri url = Uri.parse("https://valorant-api.com/v1/weapons");
    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    WeaponsModel weaponsModel = WeaponsModel.fromJson(json);
    return weaponsModel;
  }
}


// Agent API : https://valorant-api.com/v1/agents
// Maps API : https://valorant-api.com/v1/maps
// Weapons API : https://valorant-api.com/v1/weapons


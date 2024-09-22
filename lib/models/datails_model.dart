//import 'package:valorant_app/models/agent_model.dart';

import 'package:valorant_app/models/agent_model.dart';

class DetailsModel {
  //int? index;
  String? image;
  String? name;
  String? description;
  String? backGroundImage;
  List<Abilities> abilities;
  String? actionAppBar;
  DetailsModel(
      { //required this.index,
      required this.name,
      required this.image,
      required this.description,
      required this.backGroundImage,
      required this.actionAppBar,
      required this.abilities});
}

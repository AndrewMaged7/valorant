class AgentModel {
  AgentModel({
      num? status, 
      List<Agent>? data,}){
    _status = status;
    _agents = data;
}

  AgentModel.fromJson(dynamic json) {
    _status = json['status'];
    if (json['data'] != null) {
      _agents = [];
      json['data'].forEach((v) {
        _agents?.add(Agent.fromJson(v));
      });
    }
  }
  num? _status;
  List<Agent>? _agents;

  num? get status => _status;
  List<Agent>? get agents => _agents;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_agents != null) {
      map['data'] = _agents?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Agent {
  Agent({
      String? uuid, 
      String? displayName, 
      String? description, 
      String? developerName, 
      dynamic characterTags, 
      String? displayIcon, 
      String? displayIconSmall, 
      String? bustPortrait, 
      String? fullPortrait, 
      String? fullPortraitV2, 
      String? killfeedPortrait, 
      String? background, 
      List<String>? backgroundGradientColors, 
      String? assetPath, 
      bool? isFullPortraitRightFacing, 
      bool? isPlayableCharacter, 
      bool? isAvailableForTest, 
      bool? isBaseContent, 
      Role? role, 
      dynamic recruitmentData, 
      List<Abilities>? abilities, 
      dynamic voiceLine,}){
    _uuid = uuid;
    _displayName = displayName;
    _description = description;
    _developerName = developerName;
    _characterTags = characterTags;
    _displayIcon = displayIcon;
    _displayIconSmall = displayIconSmall;
    _bustPortrait = bustPortrait;
    _fullPortrait = fullPortrait;
    _fullPortraitV2 = fullPortraitV2;
    _killfeedPortrait = killfeedPortrait;
    _background = background;
    _backgroundGradientColors = backgroundGradientColors;
    _assetPath = assetPath;
    _isFullPortraitRightFacing = isFullPortraitRightFacing;
    _isPlayableCharacter = isPlayableCharacter;
    _isAvailableForTest = isAvailableForTest;
    _isBaseContent = isBaseContent;
    _role = role;
    _recruitmentData = recruitmentData;
    _abilities = abilities;
    _voiceLine = voiceLine;
}

  Agent.fromJson(dynamic json) {
    _uuid = json['uuid'];
    _displayName = json['displayName'];
    _description = json['description'];
    _developerName = json['developerName'];
    _characterTags = json['characterTags'];
    _displayIcon = json['displayIcon'];
    _displayIconSmall = json['displayIconSmall'];
    _bustPortrait = json['bustPortrait'];
    _fullPortrait = json['fullPortrait'];
    _fullPortraitV2 = json['fullPortraitV2'];
    _killfeedPortrait = json['killfeedPortrait'];
    _background = json['background'];
    _backgroundGradientColors = json['backgroundGradientColors'] != null ? json['backgroundGradientColors'].cast<String>() : [];
    _assetPath = json['assetPath'];
    _isFullPortraitRightFacing = json['isFullPortraitRightFacing'];
    _isPlayableCharacter = json['isPlayableCharacter'];
    _isAvailableForTest = json['isAvailableForTest'];
    _isBaseContent = json['isBaseContent'];
    _role = json['role'] != null ? Role.fromJson(json['role']) : null;
    _recruitmentData = json['recruitmentData'];
    if (json['abilities'] != null) {
      _abilities = [];
      json['abilities'].forEach((v) {
        _abilities?.add(Abilities.fromJson(v));
      });
    }
    _voiceLine = json['voiceLine'];
  }
  String? _uuid;
  String? _displayName;
  String? _description;
  String? _developerName;
  dynamic _characterTags;
  String? _displayIcon;
  String? _displayIconSmall;
  String? _bustPortrait;
  String? _fullPortrait;
  String? _fullPortraitV2;
  String? _killfeedPortrait;
  String? _background;
  List<String>? _backgroundGradientColors;
  String? _assetPath;
  bool? _isFullPortraitRightFacing;
  bool? _isPlayableCharacter;
  bool? _isAvailableForTest;
  bool? _isBaseContent;
  Role? _role;
  dynamic _recruitmentData;
  List<Abilities>? _abilities;
  dynamic _voiceLine;

  String? get uuid => _uuid;
  String? get displayName => _displayName;
  String? get description => _description;
  String? get developerName => _developerName;
  dynamic get characterTags => _characterTags;
  String? get displayIcon => _displayIcon;
  String? get displayIconSmall => _displayIconSmall;
  String? get bustPortrait => _bustPortrait;
  String? get fullPortrait => _fullPortrait;
  String? get fullPortraitV2 => _fullPortraitV2;
  String? get killfeedPortrait => _killfeedPortrait;
  String? get background => _background;
  List<String>? get backgroundGradientColors => _backgroundGradientColors;
  String? get assetPath => _assetPath;
  bool? get isFullPortraitRightFacing => _isFullPortraitRightFacing;
  bool? get isPlayableCharacter => _isPlayableCharacter;
  bool? get isAvailableForTest => _isAvailableForTest;
  bool? get isBaseContent => _isBaseContent;
  Role? get role => _role;
  dynamic get recruitmentData => _recruitmentData;
  List<Abilities>? get abilities => _abilities;
  dynamic get voiceLine => _voiceLine;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uuid'] = _uuid;
    map['displayName'] = _displayName;
    map['description'] = _description;
    map['developerName'] = _developerName;
    map['characterTags'] = _characterTags;
    map['displayIcon'] = _displayIcon;
    map['displayIconSmall'] = _displayIconSmall;
    map['bustPortrait'] = _bustPortrait;
    map['fullPortrait'] = _fullPortrait;
    map['fullPortraitV2'] = _fullPortraitV2;
    map['killfeedPortrait'] = _killfeedPortrait;
    map['background'] = _background;
    map['backgroundGradientColors'] = _backgroundGradientColors;
    map['assetPath'] = _assetPath;
    map['isFullPortraitRightFacing'] = _isFullPortraitRightFacing;
    map['isPlayableCharacter'] = _isPlayableCharacter;
    map['isAvailableForTest'] = _isAvailableForTest;
    map['isBaseContent'] = _isBaseContent;
    if (_role != null) {
      map['role'] = _role?.toJson();
    }
    map['recruitmentData'] = _recruitmentData;
    if (_abilities != null) {
      map['abilities'] = _abilities?.map((v) => v.toJson()).toList();
    }
    map['voiceLine'] = _voiceLine;
    return map;
  }

}

class Abilities {
  Abilities({
      String? slot, 
      String? displayName, 
      String? description, 
      String? displayIcon,}){
    _slot = slot;
    _displayName = displayName;
    _description = description;
    _displayIcon = displayIcon;
}

  Abilities.fromJson(dynamic json) {
    _slot = json['slot'];
    _displayName = json['displayName'];
    _description = json['description'];
    _displayIcon = json['displayIcon'];
  }
  String? _slot;
  String? _displayName;
  String? _description;
  String? _displayIcon;

  String? get slot => _slot;
  String? get displayName => _displayName;
  String? get description => _description;
  String? get displayIcon => _displayIcon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['slot'] = _slot;
    map['displayName'] = _displayName;
    map['description'] = _description;
    map['displayIcon'] = _displayIcon;
    return map;
  }

}

class Role {
  Role({
      String? uuid, 
      String? displayName, 
      String? description, 
      String? displayIcon, 
      String? assetPath,}){
    _uuid = uuid;
    _displayName = displayName;
    _description = description;
    _displayIcon = displayIcon;
    _assetPath = assetPath;
}

  Role.fromJson(dynamic json) {
    _uuid = json['uuid'];
    _displayName = json['displayName'];
    _description = json['description'];
    _displayIcon = json['displayIcon'];
    _assetPath = json['assetPath'];
  }
  String? _uuid;
  String? _displayName;
  String? _description;
  String? _displayIcon;
  String? _assetPath;

  String? get uuid => _uuid;
  String? get displayName => _displayName;
  String? get description => _description;
  String? get displayIcon => _displayIcon;
  String? get assetPath => _assetPath;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uuid'] = _uuid;
    map['displayName'] = _displayName;
    map['description'] = _description;
    map['displayIcon'] = _displayIcon;
    map['assetPath'] = _assetPath;
    return map;
  }

}





// class AgentModel {
//   int? status;
//   List<Data>? data;

//   AgentModel({this.status, this.data});

//   AgentModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data!.add(Data.fromJson(v));
//       });
//     }
//   }
// }

// class Data {
//   String? uuid;
//   String? displayName;
//   String? description;
//   String? developerName;
//   List<String>? characterTags;
//   String? displayIcon;
//   String? displayIconSmall;
//   String? bustPortrait;
//   String? fullPortrait;
//   String? fullPortraitV2;
//   String? killfeedPortrait;
//   String? background;
//   List<String>? backgroundGradientColors;
//   String? assetPath;
//   bool? isFullPortraitRightFacing;
//   bool? isPlayableCharacter;
//   bool? isAvailableForTest;
//   bool? isBaseContent;
//   Role? role;
//   RecruitmentData? recruitmentData;
//   List<Abilities>? abilities;
//   Null? voiceLine;

//   Data(
//       {this.uuid,
//       this.displayName,
//       this.description,
//       this.developerName,
//       this.characterTags,
//       this.displayIcon,
//       this.displayIconSmall,
//       this.bustPortrait,
//       this.fullPortrait,
//       this.fullPortraitV2,
//       this.killfeedPortrait,
//       this.background,
//       this.backgroundGradientColors,
//       this.assetPath,
//       this.isFullPortraitRightFacing,
//       this.isPlayableCharacter,
//       this.isAvailableForTest,
//       this.isBaseContent,
//       this.role,
//       this.recruitmentData,
//       this.abilities,
//       this.voiceLine});

//   Data.fromJson(Map<String, dynamic> json) {
//     uuid = json['uuid'];
//     displayName = json['displayName'];
//     description = json['description'];
//     developerName = json['developerName'];
//     characterTags = json['characterTags'].cast<String>();
//     displayIcon = json['displayIcon'];
//     displayIconSmall = json['displayIconSmall'];
//     bustPortrait = json['bustPortrait'];
//     fullPortrait = json['fullPortrait'];
//     fullPortraitV2 = json['fullPortraitV2'];
//     killfeedPortrait = json['killfeedPortrait'];
//     background = json['background'];
//     backgroundGradientColors = json['backgroundGradientColors'].cast<String>();
//     assetPath = json['assetPath'];
//     isFullPortraitRightFacing = json['isFullPortraitRightFacing'];
//     isPlayableCharacter = json['isPlayableCharacter'];
//     isAvailableForTest = json['isAvailableForTest'];
//     isBaseContent = json['isBaseContent'];
//     role = json['role'] != null ? Role.fromJson(json['role']) : null;
//     recruitmentData = json['recruitmentData'] != null
//         ? RecruitmentData.fromJson(json['recruitmentData'])
//         : null;
//     if (json['abilities'] != null) {
//       abilities = <Abilities>[];
//       json['abilities'].forEach((v) {
//         abilities!.add(Abilities.fromJson(v));
//       });
//     }
//     voiceLine = json['voiceLine'];
//   }
// }

// class Role {
//   String? uuid;
//   String? displayName;
//   String? description;
//   String? displayIcon;
//   String? assetPath;

//   Role(
//       {this.uuid,
//       this.displayName,
//       this.description,
//       this.displayIcon,
//       this.assetPath});

//   Role.fromJson(Map<String, dynamic> json) {
//     uuid = json['uuid'];
//     displayName = json['displayName'];
//     description = json['description'];
//     displayIcon = json['displayIcon'];
//     assetPath = json['assetPath'];
//   }
// }

// class RecruitmentData {
//   String? counterId;
//   String? milestoneId;
//   num? milestoneThreshold;
//   bool? useLevelVpCostOverride;
//   num? levelVpCostOverride;
//   String? startDate;
//   String? endDate;

//   RecruitmentData(
//       {this.counterId,
//       this.milestoneId,
//       this.milestoneThreshold,
//       this.useLevelVpCostOverride,
//       this.levelVpCostOverride,
//       this.startDate,
//       this.endDate});

//   RecruitmentData.fromJson(Map<String, dynamic> json) {
//     counterId = json['counterId'];
//     milestoneId = json['milestoneId'];
//     milestoneThreshold = json['milestoneThreshold'];
//     useLevelVpCostOverride = json['useLevelVpCostOverride'];
//     levelVpCostOverride = json['levelVpCostOverride'];
//     startDate = json['startDate'];
//     endDate = json['endDate'];
//   }
// }

// class Abilities {
//   String? slot;
//   String? displayName;
//   String? description;
//   String? displayIcon;

//   Abilities({this.slot, this.displayName, this.description, this.displayIcon});

//   Abilities.fromJson(Map<String, dynamic> json) {
//     slot = json['slot'];
//     displayName = json['displayName'];
//     description = json['description'];
//     displayIcon = json['displayIcon'];
//   }
// }

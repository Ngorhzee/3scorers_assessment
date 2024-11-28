enum IncidentType {
  goal,
  period,
  penaltyShootout,
  injuryTime,
  substitution,
  card,
}

final incidentTypeValues = EnumValues({
  "goal": IncidentType.goal,
  "period": IncidentType.period,
  "penaltyShootout": IncidentType.penaltyShootout,
  "injuryTime": IncidentType.injuryTime,
  "substitution": IncidentType.substitution,
  "card": IncidentType.card,
});
class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}

class IncidentModel {
  List<Incident> incidents;
  Away? home;
  Away? away;

  IncidentModel({
   required this.incidents,
    this.home,
    this.away,
  });

  factory IncidentModel.fromJson(Map<String, dynamic> json) => IncidentModel(
        incidents: json["incidents"] == null
            ? []
            : List.from(
                json["incidents"]).map((x) => Incident.fromJson(x)).toList(),
        home: json["home"] == null ? null : Away.fromJson(json["home"]),
        away: json["away"] == null ? null : Away.fromJson(json["away"]),
      );

  
}

class Away {
  ErColor? goalkeeperColor;
  ErColor? playerColor;

  Away({
    this.goalkeeperColor,
    this.playerColor,
  });

  factory Away.fromJson(Map<String, dynamic> json) => Away(
        goalkeeperColor: json["goalkeeperColor"] == null
            ? null
            : ErColor.fromJson(json["goalkeeperColor"]),
        playerColor: json["playerColor"] == null
            ? null
            : ErColor.fromJson(json["playerColor"]),
      );


}

class ErColor {
  String? primary;
  String? number;
  String? outline;
  String? fancyNumber;

  ErColor({
    this.primary,
    this.number,
    this.outline,
    this.fancyNumber,
  });

  factory ErColor.fromJson(Map<String, dynamic> json) => ErColor(
        primary: json["primary"],
        number: json["number"],
        outline: json["outline"],
        fancyNumber: json["fancyNumber"],
      );

  Map<String, dynamic> toJson() => {
        "primary": primary,
        "number": number,
        "outline": outline,
        "fancyNumber": fancyNumber,
      };
}

class Incident {
  String? text;
  int? homeScore;
  int? awayScore;
  bool? isLive;
  int? time;
  int? addedTime;
  int? timeSeconds;
  int? reversedPeriodTime;
  int? reversedPeriodTimeSeconds;
  IncidentType? incidentType;
  Player? player;
  int? sequence;
  Description? description;
  int? id;
  bool? isHome;
  String? incidentClass;
  Reason? reason;
  int? length;
  Player? playerIn;
  Player? playerOut;
  bool? injury;
  String? playerName;
  bool? rescinded;
  List<dynamic>? footballPassingNetworkAction;

  Incident({
    this.text,
    this.homeScore,
    this.awayScore,
    this.isLive,
    this.time,
    this.addedTime,
    this.timeSeconds,
    this.reversedPeriodTime,
    this.reversedPeriodTimeSeconds,
    this.incidentType,
    this.player,
    this.sequence,
    this.description,
    this.id,
    this.isHome,
    this.incidentClass,
    this.reason,
    this.length,
    this.playerIn,
    this.playerOut,
    this.injury,
    this.playerName,
    this.rescinded,
    this.footballPassingNetworkAction,
  });

  factory Incident.fromJson(Map<String, dynamic> json) => Incident(
        text: json["text"],
        homeScore: json["homeScore"],
        awayScore: json["awayScore"],
        isLive: json["isLive"],
        time: json["time"],
        addedTime: json["addedTime"],
        timeSeconds: json["timeSeconds"],
        reversedPeriodTime: json["reversedPeriodTime"],
        reversedPeriodTimeSeconds: json["reversedPeriodTimeSeconds"],
        incidentType: json["incidentType"]==null?null:incidentTypeValues.map[json["incidentType"]],
        player: json["player"] == null ? null : Player.fromJson(json["player"]),
        sequence: json["sequence"],
        description:json["description"]==null?null: descriptionValues.map[json["description"]],
        id: json["id"],
        isHome: json["isHome"],
        incidentClass: json["incidentClass"],
        reason:json["reason"]==null?null: reasonValues.map[json["reason"]],
        length: json["length"],
        playerIn:
            json["playerIn"] == null ? null : Player.fromJson(json["playerIn"]),
        playerOut: json["playerOut"] == null
            ? null
            : Player.fromJson(json["playerOut"]),
        injury: json["injury"],
        playerName: json["playerName"],
        rescinded: json["rescinded"],
      
      );

 
}

enum Description { GOALKEEPER_SAVE, SCORED }

final descriptionValues = EnumValues({
  "Goalkeeper save": Description.GOALKEEPER_SAVE,
  "Scored": Description.SCORED
});

class Player {
  String? name;
  String? slug;
  String? shortName;

  String? jerseyNumber;
  int? height;
  int? userCount;
  int? id;

  int? dateOfBirthTimestamp;

  String? firstName;
  String? lastName;

  Player({
    this.name,
    this.slug,
    this.shortName,
   
    this.jerseyNumber,
    this.height,
    this.userCount,
    this.id,
   
    this.dateOfBirthTimestamp,
   
    this.firstName,
    this.lastName,
  });

  factory Player.fromJson(Map<String, dynamic> json) => Player(
        name: json["name"],
        slug: json["slug"],
        shortName: json["shortName"],
     
        jerseyNumber: json["jerseyNumber"],
        height: json["height"],
        userCount: json["userCount"],
        id: json["id"],
       
        dateOfBirthTimestamp: json["dateOfBirthTimestamp"],
       
        firstName: json["firstName"],
        lastName: json["lastName"],
      );

 
}



enum Reason { FOUL, GOALKEEPER_SAVE, SCORED }

final reasonValues = EnumValues({
  "Foul": Reason.FOUL,
  "goalkeeperSave": Reason.GOALKEEPER_SAVE,
  "scored": Reason.SCORED
});


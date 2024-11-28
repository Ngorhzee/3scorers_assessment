class MatchDetailsModel {
  Tournament? tournament;
  Season? season;
  RoundInfo? roundInfo;
  String? customId;
  Status? status;
  int? winnerCode;
  int? aggregatedWinnerCode;
  Venue? venue;
  Referee? referee;
  Team? homeTeam;
  Team? awayTeam;
  Score? homeScore;
  Score? awayScore;
  Time? time;
  bool? hasGlobalHighlights;
  bool? hasXg;
  bool? hasEventPlayerStatistics;
  bool? hasEventPlayerHeatMap;
  int? detailId;
  bool? crowdsourcingDataDisplayEnabled;
  int? id;
  int? defaultPeriodCount;
  int? defaultPeriodLength;
  int? defaultOvertimeLength;
  int? currentPeriodStartTimestamp;
  int? previousLegEventId;
  int? startTimestamp;
  String? slug;
  bool? finalResultOnly;
  bool? feedLocked;
  int? cupMatchesInRound;
  bool? fanRatingEvent;
  String? seasonStatisticsType;
  bool? showTotoPromo;
  bool? isEditor;

  MatchDetailsModel({
    this.tournament,
    this.season,
    this.roundInfo,
    this.customId,
    this.status,
    this.winnerCode,
    this.aggregatedWinnerCode,
    this.venue,
    this.referee,
    this.homeTeam,
    this.awayTeam,
    this.homeScore,
    this.awayScore,
    this.time,
 
    this.hasGlobalHighlights,
    this.hasXg,
    this.hasEventPlayerStatistics,
    this.hasEventPlayerHeatMap,
    this.detailId,
    this.crowdsourcingDataDisplayEnabled,
    this.id,
    this.defaultPeriodCount,
    this.defaultPeriodLength,
    this.defaultOvertimeLength,
    this.currentPeriodStartTimestamp,
    this.previousLegEventId,
    this.startTimestamp,
    this.slug,
    this.finalResultOnly,
    this.feedLocked,
    this.cupMatchesInRound,
    this.fanRatingEvent,
    this.seasonStatisticsType,
    this.showTotoPromo,
    this.isEditor,
  });

  factory MatchDetailsModel.fromJson(Map<String, dynamic> json) =>
      MatchDetailsModel(
        tournament: json["tournament"] == null
            ? null
            : Tournament.fromJson(json["tournament"]),
        season: json["season"] == null ? null : Season.fromJson(json["season"]),
        roundInfo: json["roundInfo"] == null
            ? null
            : RoundInfo.fromJson(json["roundInfo"]),
        customId: json["customId"],
        status: json["status"] == null ? null : Status.fromJson(json["status"]),
        winnerCode: json["winnerCode"],
        aggregatedWinnerCode: json["aggregatedWinnerCode"],
        venue: json["venue"] == null ? null : Venue.fromJson(json["venue"]),
        referee:
            json["referee"] == null ? null : Referee.fromJson(json["referee"]),
        homeTeam:
            json["homeTeam"] == null ? null : Team.fromJson(json["homeTeam"]),
        awayTeam:
            json["awayTeam"] == null ? null : Team.fromJson(json["awayTeam"]),
        homeScore: json["homeScore"] == null
            ? null
            : Score.fromJson(json["homeScore"]),
        awayScore: json["awayScore"] == null
            ? null
            : Score.fromJson(json["awayScore"]),
        time: json["time"] == null ? null : Time.fromJson(json["time"]),
        
        hasGlobalHighlights: json["hasGlobalHighlights"],
        hasXg: json["hasXg"],
        hasEventPlayerStatistics: json["hasEventPlayerStatistics"],
        hasEventPlayerHeatMap: json["hasEventPlayerHeatMap"],
        detailId: json["detailId"],
        crowdsourcingDataDisplayEnabled:
            json["crowdsourcingDataDisplayEnabled"],
        id: json["id"],
        defaultPeriodCount: json["defaultPeriodCount"],
        defaultPeriodLength: json["defaultPeriodLength"],
        defaultOvertimeLength: json["defaultOvertimeLength"],
        currentPeriodStartTimestamp: json["currentPeriodStartTimestamp"],
        previousLegEventId: json["previousLegEventId"],
        startTimestamp: json["startTimestamp"],
        slug: json["slug"],
        finalResultOnly: json["finalResultOnly"],
        feedLocked: json["feedLocked"],
        cupMatchesInRound: json["cupMatchesInRound"],
        fanRatingEvent: json["fanRatingEvent"],
        seasonStatisticsType: json["seasonStatisticsType"],
        showTotoPromo: json["showTotoPromo"],
        isEditor: json["isEditor"],
      );
}

class Score {
  int? current;
  int? display;
  int? period1;
  int? period2;
  int? normaltime;
  int? extra1;
  int? extra2;
  int? overtime;
  int? penalties;
  int? aggregated;

  Score({
    this.current,
    this.display,
    this.period1,
    this.period2,
    this.normaltime,
    this.extra1,
    this.extra2,
    this.overtime,
    this.penalties,
    this.aggregated,
  });

  factory Score.fromJson(Map<String, dynamic> json) => Score(
        current: json["current"],
        display: json["display"],
        period1: json["period1"],
        period2: json["period2"],
        normaltime: json["normaltime"],
        extra1: json["extra1"],
        extra2: json["extra2"],
        overtime: json["overtime"],
        penalties: json["penalties"],
        aggregated: json["aggregated"],
      );

  Map<String, dynamic> toJson() => {
        "current": current,
        "display": display,
        "period1": period1,
        "period2": period2,
        "normaltime": normaltime,
        "extra1": extra1,
        "extra2": extra2,
        "overtime": overtime,
        "penalties": penalties,
        "aggregated": aggregated,
      };
}

class TeamColors {
  String? primary;
  String? secondary;
  String? text;

  TeamColors({
    this.primary,
    this.secondary,
    this.text,
  });

  factory TeamColors.fromJson(Map<String, dynamic> json) => TeamColors(
        primary: json["primary"],
        secondary: json["secondary"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "primary": primary,
        "secondary": secondary,
        "text": text,
      };
}

class Team {
  String? name;
  String? shortName;
  int? teamClass;
  String? logo;
  String? gender;
  TeamColors? teamColors;

  Team({
    this.name,
    this.shortName,
    this.teamClass,
    this.logo,
    this.gender,
    this.teamColors,
  });

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        name: json["name"],
        shortName: json["shortName"],
        teamClass: json["class"],
        logo: json["logo"],
        gender: json["gender"],
        teamColors: json["teamColors"] == null
            ? null
            : TeamColors.fromJson(json["teamColors"])
      );

 
}


class Referee {
  String? name;

  Referee({
    this.name,
  });

  factory Referee.fromJson(Map<String, dynamic> json) => Referee(
        name: json["name"],
      );
}

class RoundInfo {
  int? round;
  String? name;
  String? slug;
  int? cupRoundType;

  RoundInfo({
    this.round,
    this.name,
    this.slug,
    this.cupRoundType,
  });

  factory RoundInfo.fromJson(Map<String, dynamic> json) => RoundInfo(
        round: json["round"],
        name: json["name"],
        slug: json["slug"],
        cupRoundType: json["cupRoundType"],
      );
}

class Season {
  String? name;
  String? year;
  bool? editor;
  SeasonCoverageInfo? seasonCoverageInfo;
  int? id;

  Season({
    this.name,
    this.year,
    this.editor,
    this.seasonCoverageInfo,
    this.id,
  });

  factory Season.fromJson(Map<String, dynamic> json) => Season(
        name: json["name"],
        year: json["year"],
        editor: json["editor"],
        seasonCoverageInfo: json["seasonCoverageInfo"] == null
            ? null
            : SeasonCoverageInfo.fromJson(json["seasonCoverageInfo"]),
        id: json["id"],
      );
}

class SeasonCoverageInfo {
  SeasonCoverageInfo();

  factory SeasonCoverageInfo.fromJson(Map<String, dynamic> json) =>
      SeasonCoverageInfo();

  Map<String, dynamic> toJson() => {};
}

class Status {
  int? code;
  String? description;
  String? type;

  Status({
    this.code,
    this.description,
    this.type,
  });

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        code: json["code"],
        description: json["description"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "description": description,
        "type": type,
      };
}

class Time {
  int? injuryTime1;
  int? injuryTime2;
  int? injuryTime3;
  int? injuryTime4;
  int? currentPeriodStartTimestamp;

  Time({
    this.injuryTime1,
    this.injuryTime2,
    this.injuryTime3,
    this.injuryTime4,
    this.currentPeriodStartTimestamp,
  });

  factory Time.fromJson(Map<String, dynamic> json) => Time(
        injuryTime1: json["injuryTime1"],
        injuryTime2: json["injuryTime2"],
        injuryTime3: json["injuryTime3"],
        injuryTime4: json["injuryTime4"],
        currentPeriodStartTimestamp: json["currentPeriodStartTimestamp"],
      );

  Map<String, dynamic> toJson() => {
        "injuryTime1": injuryTime1,
        "injuryTime2": injuryTime2,
        "injuryTime3": injuryTime3,
        "injuryTime4": injuryTime4,
        "currentPeriodStartTimestamp": currentPeriodStartTimestamp,
      };
}

class Tournament {
  String? name;
  String? slug;
  Category? category;
  UniqueTournament? uniqueTournament;
  int? priority;
  bool? isGroup;
  int? competitionType;
  bool? isLive;
  int? id;

  Tournament({
    this.name,
    this.slug,
    this.category,
    this.uniqueTournament,
    this.priority,
    this.isGroup,
    this.competitionType,
    this.isLive,
    this.id,
  });

  factory Tournament.fromJson(Map<String, dynamic> json) => Tournament(
        name: json["name"],
        slug: json["slug"],
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        uniqueTournament: json["uniqueTournament"] == null
            ? null
            : UniqueTournament.fromJson(json["uniqueTournament"]),
        priority: json["priority"],
        isGroup: json["isGroup"],
        competitionType: json["competitionType"],
        isLive: json["isLive"],
        id: json["id"],
      );
}

class Category {
  String? name;
  String? slug;
  Sport? sport;
  int? id;
  SeasonCoverageInfo? country;
  String? flag;

  Category({
    this.name,
    this.slug,
    this.sport,
    this.id,
    this.country,
    this.flag,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        name: json["name"],
        slug: json["slug"],
        sport: json["sport"] == null ? null : Sport.fromJson(json["sport"]),
        id: json["id"],
        country: json["country"] == null
            ? null
            : SeasonCoverageInfo.fromJson(json["country"]),
        flag: json["flag"],
      );
}

class Sport {
  String? name;
  String? slug;
  int? id;

  Sport({
    this.name,
    this.slug,
    this.id,
  });

  factory Sport.fromJson(Map<String, dynamic> json) => Sport(
        name: json["name"],
        slug: json["slug"],
        id: json["id"],
      );
}

class UniqueTournament {
  String? name;
  String? slug;
  String? primaryColorHex;
  String? secondaryColorHex;
  Category? category;
  int? userCount;
  int? id;
  SeasonCoverageInfo? country;
  bool? hasPerformanceGraphFeature;
  bool? hasEventPlayerStatistics;
  bool? displayInverseHomeAwayTeams;

  UniqueTournament({
    this.name,
    this.slug,
    this.primaryColorHex,
    this.secondaryColorHex,
    this.category,
    this.userCount,
    this.id,
    this.country,
    this.hasPerformanceGraphFeature,
    this.hasEventPlayerStatistics,
    this.displayInverseHomeAwayTeams,
  });

  factory UniqueTournament.fromJson(Map<String, dynamic> json) =>
      UniqueTournament(
        name: json["name"],
        slug: json["slug"],
        primaryColorHex: json["primaryColorHex"],
        secondaryColorHex: json["secondaryColorHex"],
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        userCount: json["userCount"],
        id: json["id"],
        country: json["country"] == null
            ? null
            : SeasonCoverageInfo.fromJson(json["country"]),
        hasPerformanceGraphFeature: json["hasPerformanceGraphFeature"],
        hasEventPlayerStatistics: json["hasEventPlayerStatistics"],
        displayInverseHomeAwayTeams: json["displayInverseHomeAwayTeams"],
      );
}

class Venue {
  Referee? city;
  bool? hidden;
  String? slug;
  String? name;
  int? capacity;
  int? id;
  Country? country;
  FieldTranslations? fieldTranslations;
  Stadium? stadium;

  Venue({
    this.city,
    this.hidden,
    this.slug,
    this.name,
    this.capacity,
    this.id,
    this.country,
    this.fieldTranslations,
    this.stadium,
  });

  factory Venue.fromJson(Map<String, dynamic> json) => Venue(
        city: json["city"] == null ? null : Referee.fromJson(json["city"]),
        hidden: json["hidden"],
        slug: json["slug"],
        name: json["name"],
        capacity: json["capacity"],
        id: json["id"],
        country:
            json["country"] == null ? null : Country.fromJson(json["country"]),
        fieldTranslations: json["fieldTranslations"] == null
            ? null
            : FieldTranslations.fromJson(json["fieldTranslations"]),
        stadium:
            json["stadium"] == null ? null : Stadium.fromJson(json["stadium"]),
      );
}

class Country {
  String? alpha2;
  String? alpha3;
  String? name;
  String? slug;

  Country({
    this.alpha2,
    this.alpha3,
    this.name,
    this.slug,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        alpha2: json["alpha2"],
        alpha3: json["alpha3"],
        name: json["name"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "alpha2": alpha2,
        "alpha3": alpha3,
        "name": name,
        "slug": slug,
      };
}

class FieldTranslations {
  NameTranslation? nameTranslation;
  SeasonCoverageInfo? shortNameTranslation;

  FieldTranslations({
    this.nameTranslation,
    this.shortNameTranslation,
  });

  factory FieldTranslations.fromJson(Map<String, dynamic> json) =>
      FieldTranslations(
        nameTranslation: json["nameTranslation"] == null
            ? null
            : NameTranslation.fromJson(json["nameTranslation"]),
        shortNameTranslation: json["shortNameTranslation"] == null
            ? null
            : SeasonCoverageInfo.fromJson(json["shortNameTranslation"]),
      );

  Map<String, dynamic> toJson() => {
        "nameTranslation": nameTranslation?.toJson(),
        "shortNameTranslation": shortNameTranslation?.toJson(),
      };
}

class NameTranslation {
  String? ar;

  NameTranslation({
    this.ar,
  });

  factory NameTranslation.fromJson(Map<String, dynamic> json) =>
      NameTranslation(
        ar: json["ar"],
      );

  Map<String, dynamic> toJson() => {
        "ar": ar,
      };
}

class Stadium {
  String? name;
  int? capacity;

  Stadium({
    this.name,
    this.capacity,
  });

  factory Stadium.fromJson(Map<String, dynamic> json) => Stadium(
        name: json["name"],
        capacity: json["capacity"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "capacity": capacity,
      };
}

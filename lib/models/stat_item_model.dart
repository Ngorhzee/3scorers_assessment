class StatisticsItem {
  String? name;
  String? home;
  String? away;
  int? compareCode;
  StatisticsType? statisticsType;
  ValueType? valueType;
  double? homeValue;
  double? awayValue;
  int? renderType;
  String? key;
  int? homeTotal;
  int? awayTotal;

  StatisticsItem({
    this.name,
    this.home,
    this.away,
    this.compareCode,
    this.statisticsType,
    this.valueType,
    this.homeValue,
    this.awayValue,
    this.renderType,
    this.key,
    this.homeTotal,
    this.awayTotal,
  });

  factory StatisticsItem.fromJson(Map<String, dynamic> json) => StatisticsItem(
        name: json["name"],
        home: json["home"],
        away: json["away"],
        compareCode: json["compareCode"],
        statisticsType: statisticsTypeValues.map[json["statisticsType"]]!,
        valueType: valueTypeValues.map[json["valueType"]]!,
        homeValue: json["homeValue"]?.toDouble(),
        awayValue: json["awayValue"]?.toDouble(),
        renderType: json["renderType"],
        key: json["key"],
        homeTotal: json["homeTotal"],
        awayTotal: json["awayTotal"],
      );
}
enum StatisticsType {
    NEGATIVE,
    POSITIVE
}

final statisticsTypeValues = EnumValues({
    "negative": StatisticsType.NEGATIVE,
    "positive": StatisticsType.POSITIVE
});

enum ValueType {
    EVENT,
    TEAM
}

final valueTypeValues = EnumValues({
    "event": ValueType.EVENT,
    "team": ValueType.TEAM
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
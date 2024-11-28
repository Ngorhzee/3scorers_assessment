class ChartModel {
    List<GraphPoint> graphPoints;
    num periodTime;
    num periodCount;

    ChartModel({
        required this.graphPoints,
        required this.periodTime,
        required this.periodCount,
    });

    factory ChartModel.fromJson(Map<String, dynamic> json) => ChartModel(
        graphPoints:List<GraphPoint>.from(json["graphPoints"].map((x) => GraphPoint.fromJson(x))),
        periodTime: json["periodTime"],
        periodCount: json["periodCount"],
    );

    Map<String, dynamic> toJson() => {
        "graphPoints": List<dynamic>.from(graphPoints.map((x) => x.toJson())),
        "periodTime": periodTime,
        "periodCount": periodCount,
    };
}

class GraphPoint {
    num minute;
    num value;

    GraphPoint({
        required this.minute,
        required this.value,
    });

    factory GraphPoint.fromJson(Map<String, dynamic> json) => GraphPoint(
        minute: json["minute"]?.toDouble(),
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "minute": minute,
        "value": value,
    };
}

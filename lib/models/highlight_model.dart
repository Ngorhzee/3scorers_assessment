class HighlightModel {
  String? title;
  String? subtitle;
  String? url;
  String? thumbnailUrl;
  int? mediaType;
  bool? doFollow;
  bool? keyHighlight;
  int? id;
  int? createdAtTimestamp;
  String? sourceUrl;

  HighlightModel({
    this.title,
    this.subtitle,
    this.url,
    this.thumbnailUrl,
    this.mediaType,
    this.doFollow,
    this.keyHighlight,
    this.id,
    this.createdAtTimestamp,
    this.sourceUrl,
  });

  factory HighlightModel.fromJson(Map<String, dynamic> json) => HighlightModel(
        title: json["title"],
        subtitle: json["subtitle"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
        mediaType: json["mediaType"],
        doFollow: json["doFollow"],
        keyHighlight: json["keyHighlight"],
        id: json["id"],
        createdAtTimestamp: json["createdAtTimestamp"],
        sourceUrl: json["sourceUrl"],
      );
}

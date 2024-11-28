import 'package:livesscore/models/incidents_model.dart';

class BestPlayerModel {
    BestTeamPlayer? bestHomeTeamPlayer;
    BestTeamPlayer? bestAwayTeamPlayer;

    BestPlayerModel({
        this.bestHomeTeamPlayer,
        this.bestAwayTeamPlayer,
    });

    factory BestPlayerModel.fromJson(Map<String, dynamic> json) => BestPlayerModel(
        bestHomeTeamPlayer: json["bestHomeTeamPlayer"] == null ? null : BestTeamPlayer.fromJson(json["bestHomeTeamPlayer"]),
        bestAwayTeamPlayer: json["bestAwayTeamPlayer"] == null ? null : BestTeamPlayer.fromJson(json["bestAwayTeamPlayer"]),
    );

  
}

class BestTeamPlayer {
    String? value;
    String? label;
    Player? player;

    BestTeamPlayer({
        this.value,
        this.label,
        this.player,
    });

    factory BestTeamPlayer.fromJson(Map<String, dynamic> json) => BestTeamPlayer(
        value: json["value"],
        label: json["label"],
        player: json["player"] == null ? null : Player.fromJson(json["player"]),
    );

   
}

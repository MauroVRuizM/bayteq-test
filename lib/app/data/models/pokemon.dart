// To parse this JSON data, do
//
//     final pokemon = pokemonFromJson(jsonString);

import 'dart:convert';

Pokemon pokemonFromJson(String str) => Pokemon.fromJson(json.decode(str));

String pokemonToJson(Pokemon data) => json.encode(data.toJson());

class Pokemon {
  Pokemon({
    required this.sprites,
    required this.stats,
  });

  Sprites sprites;
  List<StatElement> stats;

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
    sprites: Sprites.fromJson(json["sprites"]),
    stats: List<StatElement>.from(json["stats"].map((x) => StatElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "sprites": sprites.toJson(),
    "stats": List<dynamic>.from(stats.map((x) => x.toJson())),
  };
}

class Sprites {
  Sprites({
    required this.other,
  });

  Other other;

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
    other: Other.fromJson(json["other"]),
  );

  Map<String, dynamic> toJson() => {
    "other": other.toJson(),
  };
}

class Other {
  Other({
    required this.officialArtwork,
  });

  OfficialArtwork officialArtwork;

  factory Other.fromJson(Map<String, dynamic> json) => Other(
    officialArtwork: OfficialArtwork.fromJson(json["official-artwork"]),
  );

  Map<String, dynamic> toJson() => {
    "official-artwork": officialArtwork.toJson(),
  };
}

class OfficialArtwork {
  OfficialArtwork({
    required this.frontDefault,
  });

  String frontDefault;

  factory OfficialArtwork.fromJson(Map<String, dynamic> json) => OfficialArtwork(
    frontDefault: json["front_default"],
  );

  Map<String, dynamic> toJson() => {
    "front_default": frontDefault,
  };
}

class StatElement {
  StatElement({
    required this.baseStat,
    required this.stat,
  });

  int baseStat;
  StatStat stat;

  factory StatElement.fromJson(Map<String, dynamic> json) => StatElement(
    baseStat: json["base_stat"],
    stat: StatStat.fromJson(json["stat"]),
  );

  Map<String, dynamic> toJson() => {
    "base_stat": baseStat,
    "stat": stat.toJson(),
  };
}

class StatStat {
  StatStat({
    required this.name,
  });

  String name;

  factory StatStat.fromJson(Map<String, dynamic> json) => StatStat(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}

// To parse this JSON data, do
//
//     final drinkDetail = drinkDetailFromJson(jsonString);

import 'dart:convert';

DrinkDetail drinkDetailFromJson(String str) => DrinkDetail.fromJson(json.decode(str));

String drinkDetailToJson(DrinkDetail data) => json.encode(data.toJson());

class DrinkDetail {
    DrinkDetail({
        this.drinks,
    });

    List<Map<String, String>> drinks;

    factory DrinkDetail.fromJson(Map<String, dynamic> json) => DrinkDetail(
        drinks: List<Map<String, String>>.from(json["drinks"].map((x) => Map.from(x).map((k, v) => MapEntry<String, String>(k, v == null ? null : v)))),
    );

    Map<String, dynamic> toJson() => {
        "drinks": List<dynamic>.from(drinks.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v == null ? null : v)))),
    };
}
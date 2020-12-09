// To parse this JSON data, do
//
//     final cocktail = cocktailFromJson(jsonString);

import 'dart:convert';
Cocktail cocktailFromJson(String str) => Cocktail.fromJson(json.decode(str));
String cocktailToJson(Cocktail data) => json.encode(data.toJson());

class Cocktail {
    Cocktail({
        this.drinks,
    });

    List<Drink> drinks;

    factory Cocktail.fromJson(Map<String, dynamic> json) => Cocktail(
        drinks: List<Drink>.from(json["drinks"].map((x) => Drink.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "drinks": List<dynamic>.from(drinks.map((x) => x.toJson())),
    };
}

class Drink {
    Drink({
        this.strDrink,
        this.strDrinkThumb,
        this.idDrink,
    });

    String strDrink;
    String strDrinkThumb;
    String idDrink;

    factory Drink.fromJson(Map<String, dynamic> json) => Drink(
        strDrink: json["strDrink"],
        strDrinkThumb: json["strDrinkThumb"] == null ? null : json["strDrinkThumb"],
        idDrink: json["idDrink"],
    );

    Map<String, dynamic> toJson() => {
        "strDrink": strDrink,
        "strDrinkThumb": strDrinkThumb == null ? null : strDrinkThumb,
        "idDrink": idDrink,
    };
}

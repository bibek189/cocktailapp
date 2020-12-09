import 'package:Cocktail/models/drink_detail_model.dart';
import 'package:Cocktail/models/drink_model.dart';
import 'package:Cocktail/models/searchresult_model.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  static var client = http.Client();
  static Future<Cocktail> fetchOrdinaryDrink() async {
    var response = await client.get(
        'https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Ordinary_Drink');
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return cocktailFromJson(jsonString);
    } else {
      return null;
    }
  }

  static Future<Cocktail> fetchCocktailDrink() async {
    var response = await client.get(
        'https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail');
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return cocktailFromJson(jsonString);
    } else {
      return null;
    }
  }

  static Future<DrinkDetail> fetchdetail(String id) async {
    var response = await client.get(
        'https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=' +
            id.toString());
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return drinkDetailFromJson(jsonString);
    } else {
      return null;
    }
  }
    static Future<SearchResults> fetchSearchResult(String name) async {
    var response = await client.get(
        'https://www.thecocktaildb.com/api/json/v1/1/search.php?s=' +
            name.toString());
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return searchResultsFromJson(jsonString);
    } else {
      return null;
    }
  }
}

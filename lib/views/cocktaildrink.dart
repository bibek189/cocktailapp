import 'package:Cocktail/controllers/cocktaildrink_controller.dart';
import 'package:Cocktail/views/drink_detail.dart';
import 'package:Cocktail/views/drinktile.dart';
import 'package:Cocktail/controllers/drink_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CocktailDrinkPage extends StatelessWidget {
  final CocktailDrinkController cocktailDrinkController =
      Get.put(CocktailDrinkController());
  final DrinkDetailController drinkDetailController =
      Get.put(DrinkDetailController());
  @override
  Widget build(BuildContext context) {
    bool loading = false;
    var a = MediaQuery.of(context).orientation;
    if (a == Orientation.landscape) {
      loading = true;
    }
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: false,
      body: Column(
        children: [
          Expanded(child: Obx(() {
            return cocktailDrinkController.isLoading.value
                ? Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 25,
                    ),
                  )
                : GridView.builder(
                    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: loading ? 4 : 2),
                    shrinkWrap: true,
                    scrollDirection: loading ? Axis.vertical : Axis.horizontal,
                    itemCount: cocktailDrinkController
                        .cocktaildrinks.value.drinks.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          drinkDetailController.fetchDetail(
                              cocktailDrinkController
                                  .cocktaildrinks.value.drinks[index].idDrink
                                  .toString());
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                        name: cocktailDrinkController
                                            .cocktaildrinks
                                            .value
                                            .drinks[index]
                                            .strDrink,
                                      )));
                        },
                        child: DrinkTile(
                            drink: cocktailDrinkController
                                .cocktaildrinks.value.drinks[index]),
                      );
                    });
          }))
        ],
      ),
    );
  }
}

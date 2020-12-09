import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Cocktail/controllers/drink_detail_controller.dart';

class DetailPage extends StatelessWidget {
  final String name;
  final DrinkDetailController drinkDetailController =
      Get.put(DrinkDetailController());
  DetailPage({this.name});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Obx(() {
            return drinkDetailController.isLoading.value
                ? Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 25,
                    ),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.50,
                            width: double.infinity,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Image.network(
                              drinkDetailController.drinkDetail.value.drinks[0]
                                  ['strDrinkThumb'],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Divider(),
                        Center(
                            child: Text(
                          '$name',
                          style: TextStyle(
                            fontFamily: 'avenir',
                            color: Colors.red,
                            fontSize: 20,
                          ),
                        )),
                        Row(
                          children: [
                            Expanded(child: Text("Tags :")),
                            Expanded(
                                child: Text(drinkDetailController.drinkDetail
                                        .value.drinks[0]['strTags'] ??
                                    ""))
                          ],
                        ),
                        Divider(),
                        Row(
                          children: [
                            Expanded(child: Text("Category :")),
                            Expanded(
                                child: Text(drinkDetailController.drinkDetail
                                        .value.drinks[0]['strCateory'] ??
                                    ""))
                          ],
                        ),
                        Divider(),
                        Row(
                          children: [
                            Expanded(child: Text("IBA :")),
                            Expanded(
                                child: Text(drinkDetailController.drinkDetail
                                        .value.drinks[0]['strIBA'] ??
                                    ""))
                          ],
                        ),
                        Divider(),
                        Row(
                          children: [
                            Expanded(child: Text("Glass :")),
                            Expanded(
                                child: Text(drinkDetailController.drinkDetail
                                        .value.drinks[0]['strGlass'] ??
                                    ""))
                          ],
                        ),
                        Divider(),
                        Row(
                          children: [
                            Expanded(child: Text("Alcoholic :")),
                            Expanded(
                                child: Text(drinkDetailController.drinkDetail
                                        .value.drinks[0]['strAlcoholic'] ??
                                    ""))
                          ],
                        ),
                        Divider(),
                        Center(
                          child: Text('Instructions',
                              style: TextStyle(
                                fontFamily: 'avenir',
                                color: Colors.red,
                                fontSize: 20,
                              )),
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                  drinkDetailController.drinkDetail.value
                                          .drinks[0]['strInstructions'] ??
                                      "",
                                  style: TextStyle(
                                    fontFamily: 'avenir',
                                    fontSize: 15,
                                  )),
                            )
                          ],
                        ),
                        Divider(),
                        Center(
                          child: Text('Ingredients Required',
                              style: TextStyle(
                                  fontFamily: 'avenir',
                                  fontSize: 20,
                                  color: Colors.red)),
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                  drinkDetailController.drinkDetail.value
                                          .drinks[0]['strIngredient1'] ??
                                      "" + ' : ',
                                  style: TextStyle(
                                    fontFamily: 'avenir',
                                    fontSize: 15,
                                  )),
                            ),
                            Expanded(
                              child: Text(
                                  drinkDetailController.drinkDetail.value
                                          .drinks[0]['strMeasure1'] ??
                                      "",
                                  style: TextStyle(
                                    fontFamily: 'avenir',
                                    fontSize: 15,
                                  )),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                  drinkDetailController.drinkDetail.value
                                          .drinks[0]['strIngredient2'] ??
                                      "" + ' : ',
                                  style: TextStyle(
                                    fontFamily: 'avenir',
                                    fontSize: 15,
                                  )),
                            ),
                            Expanded(
                              child: Text(
                                  drinkDetailController.drinkDetail.value
                                          .drinks[0]['strMeasure2'] ??
                                      "",
                                  style: TextStyle(
                                    fontFamily: 'avenir',
                                    fontSize: 15,
                                  )),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                  drinkDetailController.drinkDetail.value
                                          .drinks[0]['strIngredient3'] ??
                                      "" + ' : ',
                                  style: TextStyle(
                                    fontFamily: 'avenir',
                                    fontSize: 15,
                                  )),
                            ),
                            Expanded(
                              child: Text(
                                  drinkDetailController.drinkDetail.value
                                          .drinks[0]['strMeasure3'] ??
                                      "",
                                  style: TextStyle(
                                    fontFamily: 'avenir',
                                    fontSize: 15,
                                  )),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                  drinkDetailController.drinkDetail.value
                                          .drinks[0]['strIngredient4'] ??
                                      "" + ' : ',
                                  style: TextStyle(
                                    fontFamily: 'avenir',
                                    fontSize: 15,
                                  )),
                            ),
                            Expanded(
                              child: Text(
                                  drinkDetailController.drinkDetail.value
                                          .drinks[0]['strMeasure4'] ??
                                      "",
                                  style: TextStyle(
                                    fontFamily: 'avenir',
                                    fontSize: 15,
                                  )),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                  drinkDetailController.drinkDetail.value
                                          .drinks[0]['strIngredient4'] ??
                                      "" + ' : ',
                                  style: TextStyle(
                                    fontFamily: 'avenir',
                                    fontSize: 15,
                                  )),
                            ),
                            Expanded(
                              child: Text(
                                  drinkDetailController.drinkDetail.value
                                          .drinks[0]['strMeasure4'] ??
                                      "",
                                  style: TextStyle(
                                    fontFamily: 'avenir',
                                    fontSize: 15,
                                  )),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                  drinkDetailController.drinkDetail.value
                                          .drinks[0]['strIngredient5'] ??
                                      "" + ' : ',
                                  style: TextStyle(
                                    fontFamily: 'avenir',
                                    fontSize: 15,
                                  )),
                            ),
                            Expanded(
                              child: Text(
                                  drinkDetailController.drinkDetail.value
                                          .drinks[0]['strMeasure5'] ??
                                      "",
                                  style: TextStyle(
                                    fontFamily: 'avenir',
                                    fontSize: 15,
                                  )),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                  drinkDetailController.drinkDetail.value
                                          .drinks[0]['strIngredient6'] ??
                                      "" + ' : ',
                                  style: TextStyle(
                                    fontFamily: 'avenir',
                                    fontSize: 15,
                                  )),
                            ),
                            Expanded(
                              child: Text(
                                  drinkDetailController.drinkDetail.value
                                          .drinks[0]['strMeasure6'] ??
                                      "",
                                  style: TextStyle(
                                    fontFamily: 'avenir',
                                    fontSize: 15,
                                  )),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                  drinkDetailController.drinkDetail.value
                                          .drinks[0]['strIngredient7'] ??
                                      "" + ' : ',
                                  style: TextStyle(
                                    fontFamily: 'avenir',
                                    fontSize: 15,
                                  )),
                            ),
                            Expanded(
                              child: Text(
                                  drinkDetailController.drinkDetail.value
                                          .drinks[0]['strMeasure7'] ??
                                      "",
                                  style: TextStyle(
                                    fontFamily: 'avenir',
                                    fontSize: 15,
                                  )),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                  drinkDetailController.drinkDetail.value
                                          .drinks[0]['strIngredient8'] ??
                                      "" + ' : ',
                                  style: TextStyle(
                                    fontFamily: 'avenir',
                                    fontSize: 15,
                                  )),
                            ),
                            Expanded(
                              child: Text(
                                  drinkDetailController.drinkDetail.value
                                          .drinks[0]['strMeasure8'] ??
                                      "",
                                  style: TextStyle(
                                    fontFamily: 'avenir',
                                    fontSize: 15,
                                  )),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                  drinkDetailController.drinkDetail.value
                                          .drinks[0]['strIngredient9'] ??
                                      "" + ' : ',
                                  style: TextStyle(
                                    fontFamily: 'avenir',
                                    fontSize: 15,
                                  )),
                            ),
                            Expanded(
                              child: Text(
                                  drinkDetailController.drinkDetail.value
                                          .drinks[0]['strMeasure9'] ??
                                      "",
                                  style: TextStyle(
                                    fontFamily: 'avenir',
                                    fontSize: 15,
                                  )),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                  drinkDetailController.drinkDetail.value
                                          .drinks[0]['strIngredient10'] ??
                                      "" + ' : ',
                                  style: TextStyle(
                                    fontFamily: 'avenir',
                                    fontSize: 15,
                                  )),
                            ),
                            Expanded(
                              child: Text(
                                  drinkDetailController.drinkDetail.value
                                          .drinks[0]['strMeasure10'] ??
                                      "",
                                  style: TextStyle(
                                    fontFamily: 'avenir',
                                    fontSize: 15,
                                  )),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                  drinkDetailController.drinkDetail.value
                                          .drinks[0]['strIngredient11'] ??
                                      "" + ' : ',
                                  style: TextStyle(
                                    fontFamily: 'avenir',
                                    fontSize: 15,
                                  )),
                            ),
                            Expanded(
                              child: Text(
                                  drinkDetailController.drinkDetail.value
                                          .drinks[0]['strMeasure11'] ??
                                      "",
                                  style: TextStyle(
                                    fontFamily: 'avenir',
                                    fontSize: 15,
                                  )),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                  drinkDetailController.drinkDetail.value
                                          .drinks[0]['strIngredient12'] ??
                                      "" + ' : ',
                                  style: TextStyle(
                                    fontFamily: 'avenir',
                                    fontSize: 15,
                                  )),
                            ),
                            Expanded(
                              child: Text(
                                  drinkDetailController.drinkDetail.value
                                          .drinks[0]['strMeasure12'] ??
                                      "",
                                  style: TextStyle(
                                    fontFamily: 'avenir',
                                    fontSize: 15,
                                  )),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                  drinkDetailController.drinkDetail.value
                                          .drinks[0]['strIngredient13'] ??
                                      "" + ' : ',
                                  style: TextStyle(
                                    fontFamily: 'avenir',
                                    fontSize: 15,
                                  )),
                            ),
                            Expanded(
                              child: Text(
                                  drinkDetailController.drinkDetail.value
                                          .drinks[0]['strMeasure13'] ??
                                      "",
                                  style: TextStyle(
                                    fontFamily: 'avenir',
                                    fontSize: 15,
                                  )),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                  drinkDetailController.drinkDetail.value
                                          .drinks[0]['strIngredient14'] ??
                                      "" + ' : ',
                                  style: TextStyle(
                                    fontFamily: 'avenir',
                                    fontSize: 15,
                                  )),
                            ),
                            Expanded(
                              child: Text(
                                  drinkDetailController.drinkDetail.value
                                          .drinks[0]['strMeasure14'] ??
                                      "",
                                  style: TextStyle(
                                    fontFamily: 'avenir',
                                    fontSize: 15,
                                  )),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                  drinkDetailController.drinkDetail.value
                                          .drinks[0]['strIngredient15'] ??
                                      "" + ' : ',
                                  style: TextStyle(
                                    fontFamily: 'avenir',
                                    fontSize: 15,
                                  )),
                            ),
                            Expanded(
                              child: Text(
                                  drinkDetailController.drinkDetail.value
                                          .drinks[0]['strMeasure15'] ??
                                      "",
                                  style: TextStyle(
                                    fontFamily: 'avenir',
                                    fontSize: 15,
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
          })),
        ],
      ),
    );
  }
}

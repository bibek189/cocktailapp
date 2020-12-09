import 'package:flutter/material.dart';
import 'package:Cocktail/models/drink_model.dart';

class DrinkTile extends StatelessWidget {
  final Drink drink;
  const DrinkTile({this.drink});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height*0.33,
                    width: double.infinity,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Image.network(
                      drink.strDrinkThumb,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 6),
            Text(
              drink.strDrink,
              maxLines: 1,
              style:
                  TextStyle(fontFamily: 'avenir', fontWeight: FontWeight.w800,fontSize: 10),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

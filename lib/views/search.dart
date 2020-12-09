import 'package:Cocktail/views/drink_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:Cocktail/controllers/search_controller.dart';
import 'package:Cocktail/controllers/drink_detail_controller.dart';

class DataSearch extends SearchDelegate<String> {
  final recent = [
    'Margarita',
    'Mojito',
    'Old Cuban',
    'Martini',
  ];
  get a => query;
  final searchResultsController = Get.put(SearchResultController());
  final drinkDetailController = Get.put(DrinkDetailController());
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          }),
      IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            searchResultsController.fetchSearchResult(a);
            showResults(context);
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    bool loading = false;
    var a = MediaQuery.of(context).orientation;
    if (a == Orientation.landscape) {
      loading = true;
    }
    return Column(
      children: [
        Expanded(
          child: Obx(() {
            return searchResultsController.isLoading.value
                ? Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 40,
                    ),
                  )
                : StaggeredGridView.countBuilder(
                    crossAxisCount: loading ? 4 : 2,
                    itemCount: searchResultsController
                        .searchResult.value.drinks.length,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    itemBuilder: (context, index) {
                      if (searchResultsController
                              .searchResult.value.drinks.length >
                          0) {
                        return InkWell(
                          onTap: () {
                            drinkDetailController.fetchDetail(
                                searchResultsController
                                    .searchResult.value.drinks[index]['idDrink']
                                    .toString());
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailPage(
                                          name: searchResultsController
                                              .searchResult
                                              .value
                                              .drinks[index]['strDrink'],
                                        )));
                          },
                          child: SearchTile(
                            id: searchResultsController
                                .searchResult.value.drinks[index]['idDrink'],
                            name: searchResultsController
                                .searchResult.value.drinks[index]['strDrink'],
                            image: searchResultsController.searchResult.value
                                .drinks[index]['strDrinkThumb'],
                          ),
                        );
                      } else {
                        return Center(
                            child: Text("No recipe matched your search"));
                      }
                    },
                    staggeredTileBuilder: (index) => StaggeredTile.fit(1));
          }),
        ),
      ],
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty ? recent : recent;
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          searchResultsController.fetchSearchResult(suggestionList[index]);
          showResults(context);
        },
        leading: Icon(Icons.local_drink_sharp),
        title: Text(suggestionList[index]),
      ),
      itemCount: suggestionList.length,
    );
  }
}

class SearchTile extends StatelessWidget {
  final String id;
  final String name;
  final String image;
  SearchTile({this.id, this.name, this.image});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              name,
              maxLines: 2,
              style:
                  TextStyle(fontFamily: 'avenir', fontWeight: FontWeight.w800),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

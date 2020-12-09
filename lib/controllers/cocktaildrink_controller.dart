import 'package:Cocktail/models/drink_model.dart';
import 'package:Cocktail/networkcalls/remote_services.dart';
import 'package:get/state_manager.dart';


class CocktailDrinkController extends GetxController{
  var cocktaildrinks = Cocktail().obs;
  var isLoading=true.obs;

  @override
  void onInit(){
    fetchCocktailDrink();
    super.onInit();

  }
  void fetchCocktailDrink() async{
    try {
      isLoading(true);
      var result = await RemoteServices.fetchCocktailDrink();
      if(result!= null){
        cocktaildrinks.value = result;
      }
    } finally{
      isLoading(false);
    }
  }

}
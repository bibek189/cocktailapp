import 'package:Cocktail/models/drink_model.dart';
import 'package:Cocktail/networkcalls/remote_services.dart';
import 'package:get/state_manager.dart';


class OrdinaryDrinkController extends GetxController{
  var ordinarydrinks = Cocktail().obs;
  var isLoading=true.obs;

  @override
  void onInit(){
    fetchOrdinaryDrink();
    super.onInit();

  }
  void fetchOrdinaryDrink() async{
    try {
      isLoading(true);
      var result = await RemoteServices.fetchOrdinaryDrink();
      
      if(result!= null){
        ordinarydrinks.value = result;
        print("aaaaa");
        print(ordinarydrinks);
      }
    } finally{
      isLoading(false);
    }
  }

}
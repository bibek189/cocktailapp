import 'package:Cocktail/models/drink_detail_model.dart';
import 'package:Cocktail/networkcalls/remote_services.dart';
import 'package:get/state_manager.dart';

class DrinkDetailController extends GetxController{
  var drinkDetail = DrinkDetail().obs;
  var isLoading=true.obs;

  void fetchDetail(String idd) async{
        String a = idd;
    try{
      isLoading(true);

      var detail = await RemoteServices.fetchdetail(a);
      if(detail!=null){
        drinkDetail.value = detail;
      }
    }
    finally{
      isLoading(false);
    }
  }
}
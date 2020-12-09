import 'package:Cocktail/models/searchresult_model.dart';
import 'package:Cocktail/networkcalls/remote_services.dart';
import 'package:get/state_manager.dart';

class SearchResultController extends GetxController{
  var searchResult = SearchResults().obs;
  var isLoading=true.obs;

  void fetchSearchResult(String namee) async{
        String a = namee;
    try{
      isLoading(true);

      var result = await RemoteServices.fetchSearchResult(a);
      if(result!=null){
        searchResult.value = result;
      }
    }
    finally{
      isLoading(false);
    }
  }
}
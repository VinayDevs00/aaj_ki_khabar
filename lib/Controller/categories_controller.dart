import 'package:aaj_ki_khabar/Controller/Services/api_services.dart';
import 'package:aaj_ki_khabar/Model/categories_model.dart';
import 'package:aaj_ki_khabar/Model/categories_post_model.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController {

  var categoriesList = <CategoriesModel>[].obs;
  var dataLength = 0.obs;
  final categoryWisePostMap = Map<String, List<CategoriesPostModel>>().obs;
  var currentCategoryTab = 1.obs;
  var itemCount = 0.obs;


  @override
  void onInit() async {
    await fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories() async {
    try {
      var categories = await ApiService.fetchCategories();
      if (categories.length > 0) {
        categoriesList.clear();
        categoriesList.value = categories;
        print(categories[1].toString());
        dataLength.value = categoriesList.length;
        update();
      }
    } catch (e) {
      print(e.toString());
    }
  }


  Future<void> addPostLstCatWise(categoryId, categoryIndex) async {
    try {
      var categoriesPOST = await ApiService.fetchCategoriesPost(categoryId);
      print("CategoryList Length is 2+ ${categoriesPOST.length.toString()}");
      if (categoriesPOST.length > 0) {
        categoryWisePostMap.addAll({categoryIndex.toString(): categoriesPOST});
        itemCount.value = categoryWisePostMap[1.toString()].length;
      }
      update();
    }

    catch (e) {
      print(e.toString());
    }
  }

  Future<void> updatePOstliSTdATA(index) async {
    try {
      itemCount.value = await categoryWisePostMap[index].length;
      update();
  }
  catch (e){
      print(e.toString());
    }

  }



}
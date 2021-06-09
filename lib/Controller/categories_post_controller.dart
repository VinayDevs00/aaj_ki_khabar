import 'package:aaj_ki_khabar/Controller/Services/api_services.dart';
import 'package:aaj_ki_khabar/Controller/categories_controller.dart';
import 'package:aaj_ki_khabar/Controller/post_controller.dart';
import 'package:aaj_ki_khabar/Model/categories_model.dart';
import 'package:aaj_ki_khabar/Model/categories_post_model.dart';
import 'package:aaj_ki_khabar/Model/posts_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesPOstController extends GetxController {



  var postList = <CategoriesPostModel>[].obs;
  var postThumbnailUrl = "link".obs;
  var postThumnailId = 0.obs;
  var isLoadind = true.obs;
  var itemCount =0.obs;


  @override
  void onInit() {
    fetchPosts(postThumnailId);
    super.onInit();
  }

  Future<void> fetchPosts(categoryId) async{
    print("fetch category posts called");

    try{
      var posts = await ApiService.fetchCategoriesPost(categoryId);
      if(posts.length > 0){
        postList.clear();
        isLoadind.value = false;
        postList.addAll(posts);
      }else{

      }
    }

    catch (e){
      print(e.toString());
    }

  }




}
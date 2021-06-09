import 'package:aaj_ki_khabar/Controller/Services/api_services.dart';
import 'package:aaj_ki_khabar/Model/categories_model.dart';
import 'package:aaj_ki_khabar/Model/postcontroller_hive_model.dart';
import 'package:aaj_ki_khabar/Model/posts_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';


class PostController extends GetxController {

  var postList = <PostsModel>[].obs;
  var postListHive = <PostControllerHiveModel>[].obs;

  var _currentSliderIndex = 0.obs;



  @override
  void onInit() async{
    fetchPosts();
    super.onInit();
  }



  Future<void> fetchPosts() async{

    print("fetch posts called");

    try{
      var posts = await ApiService.fetchPosts();
      if(posts.length > 0){
      postList.clear();
      postList.addAll(posts);
           }
    }
    catch (e){
      print(e.toString());
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

}
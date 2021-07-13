import 'dart:io';

import 'package:aaj_ki_khabar/Model/categories_model.dart';
import 'package:aaj_ki_khabar/Model/categories_post_model.dart';
import 'package:aaj_ki_khabar/Model/posts_model.dart';
import 'package:http/http.dart' as http;

import '../config.dart';

class ApiService{
static var client = http.Client();
static Future<List<CategoriesModel>> fetchCategories() async{

  print("fetch categories called");

  var url = Uri.https(Config.apiURL, Config.categoryURL, {'q': '{http}'});

  var response = await client.get(Uri.parse("https://www.aajkikhabar.com/wp-json/wp/v2/categories"));

  if(response.statusCode == 200){

    var jsonString = response.body;

    return categoriesModelFromJson(jsonString);

  }
}

static Future<List<PostsModel>> fetchPosts() async{


  var response = await client.get(Uri.parse("https://www.aajkikhabar.com/wp-json/wp/v2/posts?_embed"));

  if(response.statusCode == 200){

    var jsonString = response.body;
    print("response code ${response.statusCode}");
    return postsModelFromJson(jsonString);

  }else{
    print("response code ${response.statusCode}");
  }

}


static Future<List<CategoriesPostModel>> fetchCategoriesPost(categoryId) async{

  // var url = Uri.https("www.aajkikhabar.com", "/wp-json/wp/v2/posts", {'q': '{http}'});
  print("fetchCategoriesPost exetuted");


  var response = await client.get(Uri.parse("https://www.aajkikhabar.com/wp-json/wp/v2/posts?categories=$categoryId&_embed"));

  if(response.statusCode == 200){

    var jsonString = response.body;
    print("response code ${response.statusCode}");
    return categoriesPostModelFromJson(jsonString);

  }else{
    print("response code ${response.statusCode}");
  }

}

}
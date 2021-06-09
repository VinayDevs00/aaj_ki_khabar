import 'package:aaj_ki_khabar/Controller/categories_controller.dart';
import 'package:aaj_ki_khabar/Controller/categories_post_controller.dart';
import 'package:aaj_ki_khabar/Controller/post_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CategoryPostDetailScreen extends StatelessWidget {
  final postNumber;

  CategoryPostDetailScreen({Key key, this.postNumber}) : super(key: key);

final CategoriesController categoriesController = Get.find(tag: "categoryPOstTag");
  @override
  Widget build(BuildContext context) {


    final sSize = MediaQuery.of(context).size;

    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Stack(
            children: [
              Container(
              height: sSize.height * 0.4,
              width: sSize.width,
              child: CachedNetworkImage(
               imageUrl : categoriesController
                    .categoryWisePostMap[categoriesController.currentCategoryTab.toString()][postNumber].embedded.wpFeaturedmedia[0].link
                    .toString(),
                errorWidget: (context, url, error) => Icon(Icons.error),
                fit: BoxFit.cover,
                width: sSize.width * 0.2,
              ),
            ),
              AppBar(backgroundColor: Colors.transparent,elevation: 0,),
      ]
          ),

          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(categoriesController
                    .categoryWisePostMap[categoriesController.currentCategoryTab.toString()][postNumber].title.rendered
                    .toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text( categoriesController
                    .categoryWisePostMap[categoriesController.currentCategoryTab.toString()][postNumber].content.rendered
                    .toString(),style: TextStyle(fontSize: 20),),
              )
            ],

          )
        ],
      ),
    );
  }
}

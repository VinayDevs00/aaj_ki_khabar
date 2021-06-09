import 'package:aaj_ki_khabar/Controller/categories_controller.dart';
import 'package:aaj_ki_khabar/Controller/categories_post_controller.dart';
import 'package:aaj_ki_khabar/Controller/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategodyPostList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Obx(()
        => ListView.builder(
            itemCount: 5,
            itemBuilder: (c, i) {
          return Obx(() => Text("Hello"));
        }),
      );
    });
  }
}
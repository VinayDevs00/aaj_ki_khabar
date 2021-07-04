import 'package:aaj_ki_khabar/Controller/categories_controller.dart';
import 'package:aaj_ki_khabar/Controller/categories_post_controller.dart';
import 'package:aaj_ki_khabar/Controller/post_controller.dart';
import 'package:aaj_ki_khabar/View/Screens/post_detail_screen.dart';
import 'package:aaj_ki_khabar/View/TabWidgets/category_postlist_widget.dart';
import 'package:aaj_ki_khabar/View/TabWidgets/home_tab_widgets.dart';
import 'package:aaj_ki_khabar/View/Widgets/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'category_post_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CategoriesController categoriesController2 =
      Get.put(CategoriesController(), tag: "categoryPOstTag");
  final CategoriesPOstController categoriesPOstController =
      Get.put(CategoriesPOstController(), tag: "catPostController");
  final PostController postController =
      Get.put(PostController(), tag: "postController");
  Box box;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("Check1 Home Sccreen build Executed");

    final sSize = MediaQuery.of(context).size;

    ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
      return Scaffold(
        body: Center(
          child: Text(
            "Error appeared.",
            style: Theme.of(context).textTheme.title,
          ),
        ),
      );
    };

    _tabDataUpdation(tabController) async {
      categoriesController2.currentCategoryTab.value = tabController.index;
      await categoriesController2.updatePOstliSTdATA(tabController.index);
    }

    return Obx(() {
      return DefaultTabController(
          length: categoriesController2.categoriesList.length < 0
              ? 1
              : categoriesController2.categoriesList.length,
          child: Builder(builder: (context) {
            final TabController tabController =
                DefaultTabController.of(context);
            tabController.addListener(() {
              if (!tabController.indexIsChanging) {
                print("Tab Index Change to ${tabController.index}");
                _tabDataUpdation(tabController);
              }
            });

            return Scaffold(
              appBar: AppBar(
                title: Obx(() {
                  return Text(
                      ("${postController.postListHive.length.toString()}"));
                }),
                bottom: TabBar(
                    labelColor: Colors.black,
                    isScrollable: true,
                    indicatorColor: Colors.transparent,
                    tabs: categoriesController2.categoriesList.length < 0
                        ? [
                            Tab(
                              child: Text("Loading.."),
                            )
                          ]
                        : List.generate(
                            categoriesController2.categoriesList.length,
                            (index) {
                            if (index == 0) {
                              return Tab(child: Text("Home"));
                            } else {
                              categoriesController2.addPostLstCatWise(
                                  categoriesController2
                                      .categoriesList[index - 1].id,
                                  index);
                              return Tab(
                                  child: Text(categoriesController2
                                      .categoriesList[index - 1].name
                                      .toString()));
                            }
                          })),
              ),
              body: Obx(
                () => TabBarView(
                  children: categoriesController2.categoriesList.length < 0
                      ? [Text("Loading..")]
                      : List.generate(
                          categoriesController2.categoriesList.length, (index) {
                          if (index == 0) {
                            return HomeTabWidget();
                          } else {
                            return Obx(
                              () {
                                return ListView.builder(
                                    itemCount: categoriesController2
                                        .categoryWisePostMap[
                                            categoriesController2
                                                .currentCategoryTab
                                                .toString()]
                                        .length,
                                    itemBuilder: (c, i) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                            left: 16.0, right: 16.0, top: 16.0),
                                        child: MyWidgets().postCard(
                                          sSize: sSize,
                                          thumbnail : categoriesController2
                                                    .categoryWisePostMap[
                                                        categoriesController2
                                                            .currentCategoryTab
                                                            .toString()][i]
                                                    .embedded
                                                    .wpFeaturedmedia[0]
                                                    .link
                                                    .toString(),
                                          title: categoriesController2
                                              .categoryWisePostMap[
                                                  categoriesController2
                                                      .currentCategoryTab
                                                      .toString()][i]
                                              .title
                                              .rendered
                                              .toString(),
                                        ),
                                      );

                                      // return ListTile(
                                      //   onTap: () {
                                      //     Navigator.push(
                                      //       context,
                                      //       MaterialPageRoute(
                                      //           builder: (context) =>
                                      //               CategoryPostDetailScreen(
                                      //                 postNumber: i,
                                      //               )),
                                      //     );
                                      //   },
                                      //   leading: CachedNetworkImage(
                                      //     imageUrl: categoriesController2
                                      //         .categoryWisePostMap[
                                      //             categoriesController2
                                      //                 .currentCategoryTab
                                      //                 .toString()][i]
                                      //         .embedded
                                      //         .wpFeaturedmedia[0]
                                      //         .link
                                      //         .toString(),
                                      //     errorWidget: (context, url, error) =>
                                      //         Icon(Icons.error),
                                      //     fit: BoxFit.contain,
                                      //     width: Get.size.width * 0.2,
                                      //   ),
                                      //   title: Text(
                                      //     categoriesController2
                                      //         .categoryWisePostMap[
                                      //             categoriesController2
                                      //                 .currentCategoryTab
                                      //                 .toString()][i]
                                      //         .title
                                      //         .rendered
                                      //         .toString(),
                                      //     maxLines: 3,
                                      //   ),
                                      // );
                                    });
                              },
                            );
                          }
                        }),
                ),
              ),
            );
          }));
    });
  }
}

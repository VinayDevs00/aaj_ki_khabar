import 'package:aaj_ki_khabar/Controller/categories_controller.dart';
import 'package:aaj_ki_khabar/Controller/post_controller.dart';
import 'package:aaj_ki_khabar/Model/categories_model.dart';
import 'package:aaj_ki_khabar/View/Screens/post_detail_screen.dart';
import 'package:aaj_ki_khabar/View/Widgets/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/* Home 
Tab 
Widget */

class HomeTabWidget extends StatefulWidget {
  @override
  _HomeTabWidgetState createState() => _HomeTabWidgetState();
}

class _HomeTabWidgetState extends State<HomeTabWidget> {
  final CategoriesController categoriesController =
      Get.put(CategoriesController(), tag: "catPostController");
  final PostController postController = Get.find(tag: "postController");

  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final sSize = MediaQuery.of(context).size;
    print(
        "POstLIst length on main page ${postController.postList[1].title.rendered.toString()}");
    final List<String> imgList = [
      'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
      'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
      'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
      'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80',
    ];

    final List<Widget> imageSliders = imgList
        .map((item) => Container(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25.0),
                        topLeft: Radius.circular(25.0)),
                    child: Stack(children: [
                      Image.network(
                        item,
                        fit: BoxFit.cover,
                        width: sSize.width * 0.95,
                        height: sSize.height * 0.2,
                      ),
                      Container(
                        width: sSize.width * 0.95,
                        height: sSize.height * 0.2,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Color(0xFFE0E0EB).withOpacity(0.4),
                                Colors.transparent,
                              ]),
                        ),
                      ),
                    ]),
                  ),

                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25.0),
                        bottomRight: Radius.circular(25.0)),
                    child: Container(
                      height: sSize.height * 0.09,
                      width: sSize.width * 0.95,
                      color: Color(0xFFE0E0EB),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Hello! How Are You? Everything is Fine",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                    ),
                  )
                  // Positioned(
                  //   bottom: 0.0,
                  //   left: 0.0,
                  //   right: 0.0,
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       gradient: LinearGradient(
                  //         colors: [
                  //           Color.fromARGB(200, 0, 0, 0),
                  //           Color.fromARGB(0, 0, 0, 0)
                  //         ],
                  //         begin: Alignment.bottomCenter,
                  //         end: Alignment.topCenter,
                  //       ),
                  //     ),
                  //     padding: EdgeInsets.symmetric(
                  //         vertical: 10.0, horizontal: 10.0),
                  //     child: Text(
                  //       'No. ${imgList.indexOf(item)} image',
                  //       style: TextStyle(
                  //         color: Colors.white,
                  //         fontSize: 20.0,
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ))
        .toList();

    return CustomScrollView(
      slivers: [

        SliverList(

            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
            
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(height: sSize.height * 0.2,
                      width: sSize.width * 0.8,
                      color: Colors.red,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(height: sSize.height * 0.2,
                      width: sSize.width * 0.8,
                      color: Colors.red,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(height: sSize.height * 0.2,
                      width: sSize.width * 0.8,
                      color: Colors.red,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(height: sSize.height * 0.2,
                      width: sSize.width * 0.8,
                      color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ])),

        SliverList(

            delegate: SliverChildListDelegate([
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Latest News",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ])),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.dialog(AlertDialog(
                    title: Text("Clicked ON ${index}"),
                  ));
                },
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0),
                  child: Container(
                      width: sSize.width,
                      height: sSize.height * 0.15,
                      child: Stack(children: <Widget>[
                        Container(
                            width: sSize.width * 0.92,
                            height: sSize.height * 0.15,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(24),
                                topRight: Radius.circular(24),
                                bottomLeft: Radius.circular(24),
                                bottomRight: Radius.circular(24),
                              ),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(
                                        0, 0, 0, 0.10000000149011612),
                                    offset: Offset(6, 6),
                                    blurRadius: 55)
                              ],
                              color: Color(0xFFE0E0EB),
                            )),
                        Row(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Container(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12.0)),
                                      child: CachedNetworkImage(
                                        imageUrl: postController
                                            .postList[index]
                                            .embedded
                                            .wpFeaturedmedia[0]
                                            .sourceUrl
                                            .toString(),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    width: sSize.width * 0.25,
                                    height: sSize.height * 0.12,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(12),
                                        topRight: Radius.circular(12),
                                        bottomLeft: Radius.circular(12),
                                        bottomRight: Radius.circular(12),
                                      ),
                                      color: Color.fromRGBO(153, 153, 153, 1),
                                    )),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                width: sSize.width * 0.58,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      postController
                                          .postList[index].title.rendered
                                          .toString(),
                                      maxLines: 3,
                                      style: TextStyle(
                                          color: Color.fromRGBO(29, 31, 33, 1),
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          height: 1),
                                    ),

                                    Row(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.circle,
                                              size: 7,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              postController.postList[index]
                                                  .embedded.wpTerm[0][0].name
                                                  .toString(),
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.circle,
                                              size: 7,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "Today",
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),

                                    // Container(
                                    //      width: 82,
                                    //      height: 22,
                                    //
                                    //      child: Stack(
                                    //          children: <Widget>[
                                    //            Positioned(
                                    //                top: 0,
                                    //                left: 0,
                                    //                child: Container(
                                    //                    width: 82,
                                    //                    height: 22,
                                    //                    decoration: BoxDecoration(
                                    //                      borderRadius : BorderRadius.only(
                                    //                        topLeft: Radius.circular(12),
                                    //                        topRight: Radius.circular(12),
                                    //                        bottomLeft: Radius.circular(12),
                                    //                        bottomRight: Radius.circular(12),
                                    //                      ),
                                    //                      color : Color.fromRGBO(83, 150, 255, 1),
                                    //                    )
                                    //                )
                                    //            ),Positioned(
                                    //                top: 3,
                                    //                left: 25,
                                    //                child: Text('Sports', textAlign: TextAlign.left, style: TextStyle(
                                    //                    color: Color.fromRGBO(255, 255, 255, 1),
                                    //                    fontFamily: 'Poppins',
                                    //                    fontSize: 10,
                                    //                    letterSpacing: 0,
                                    //                    fontWeight: FontWeight.normal,
                                    //                    height: 1
                                    //                ),)
                                    //            ),
                                    //          ]
                                    //      )
                                    //  ),Text('2 min ago', textAlign: TextAlign.left, style: TextStyle(
                                    //      color: Color.fromRGBO(83, 150, 255, 1),
                                    //      fontFamily: 'Poppins',
                                    //      fontSize: 10,
                                    //      letterSpacing: 0,
                                    //      fontWeight: FontWeight.normal,
                                    //      height: 1
                                    //  ),),
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      ])),
                ),
              );
            },
            childCount: postController.postList.length,
          ),
        )
      ],
    );
  }
}

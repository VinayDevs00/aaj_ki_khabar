import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

 class MyWidgets {





  //ToDo : PostCard
   Widget postCard({@required sSize,@required title,@required thumbnail}){
     return Container(
         width: sSize.width,
         height: sSize.height *0.15,
         child: Stack(
             children: <Widget>[
               Container(
                   width: sSize.width * 0.92,
                   height: sSize.height * 0.15,
                   decoration: BoxDecoration(
                     borderRadius : BorderRadius.only(
                       topLeft: Radius.circular(24),
                       topRight: Radius.circular(24),
                       bottomLeft: Radius.circular(24),
                       bottomRight: Radius.circular(24),
                     ),
                     boxShadow : [BoxShadow(
                         color: Color.fromRGBO(0, 0, 0, 0.10000000149011612),
                         offset: Offset(6,6),
                         blurRadius: 55
                     )],

                     color : Color(0xFFE0E0EB),
                   )
               ),

               Row(
                 children: [

                   Align(
                     alignment: Alignment.centerLeft,
                     child: Padding(
                       padding: const EdgeInsets.only(left: 8.0),
                       child: Container(
                         child: ClipRRect(
                           borderRadius: BorderRadius.all(Radius.circular(12.0)),
                           child: CachedNetworkImage(
                             imageUrl: thumbnail,


fit: BoxFit.cover,
                           ),
                         ),
                           width: sSize.width * 0.25,
                           height: sSize.height * 0.12,
                           decoration: BoxDecoration(
                             borderRadius : BorderRadius.only(
                               topLeft: Radius.circular(12),
                               topRight: Radius.circular(12),
                               bottomLeft: Radius.circular(12),
                               bottomRight: Radius.circular(12),
                             ),
                             color : Color.fromRGBO(153, 153, 153, 1),

                           )
                       ),
                     ),
                   ),

                   Padding(
                     padding: const EdgeInsets.all(10.0),
                     child: Container(
                       width: sSize.width * 0.58,
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.end,

                         children: [

                           Text(title,maxLines: 3, style: TextStyle(
                               color: Color.fromRGBO(29, 31, 33, 1),
                               fontFamily: 'Poppins',
                               fontSize: 16,
                               fontWeight: FontWeight.normal,
                               height: 1
                           ),),


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
             ]
         )
     );
   }

   //ToDo : SliderCard

 Widget sliderCard(sSize,imgList,index){
  return Column(
    children: [
      Container(
        height: sSize.height*0.2,
        width: sSize.width*0.8,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight:Radius.circular(25)),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25) ),
          child: Image.network(imgList[index],fit: BoxFit.cover,),
        ),
      ),
      Container(
        height: sSize.height*0.08,
        width: sSize.width*0.8,
        decoration: BoxDecoration(
          color : Color(0xFFE0E0EB),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),bottomRight:Radius.circular(25)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Hello How Are You?"),
        ),
      )
    ],
  );
 }

}
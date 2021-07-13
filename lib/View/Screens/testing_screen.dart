import 'package:aaj_ki_khabar/Controller/Services/api_services.dart';
import 'package:flutter/material.dart';

class TestingScreen extends StatelessWidget {
  const TestingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  FutureBuilder(
          future: ApiService.fetchPosts(),
          builder: (context,snapshot){

            if(snapshot.connectionState == ConnectionState.done){

              switch(snapshot.connectionState){

                case ConnectionState.none : return new CircularProgressIndicator();
                case ConnectionState.waiting : return new CircularProgressIndicator();
                default:
                  if(snapshot.hasError){
                    return new Text('Error : ${snapshot.error}');
                  }
                  else
                    return new ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context,index){
                        return new Text(index.toString());
                      },

                    );



              }

            }


          }),
    );
  }
}
